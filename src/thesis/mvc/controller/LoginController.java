package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.model.Login;
import thesis.mvc.pageaction.LoginAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.SendEmail;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public LoginController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String forward = "A-test-login.jsp";
		//RequestDispatcher view = request.getRequestDispatcher( forward );
		//view.forward(request, response);
		String forward;
		HttpSession session = request.getSession();
		
		if ((int) session.getAttribute("userID") > 0) {
			LoginAction loginAction = new LoginAction();
			loginAction.logoutUser((int)session.getAttribute("userID"), (String)session.getAttribute("username"));
			session.removeAttribute("userID");
			session.removeAttribute("username");
			session.removeAttribute("userAccess");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			forward = "A-test-pharmacistapproval.jsp";
			OrderImplement orderImplement = new OrderImplement();
			session.setAttribute("orderImplementPharmacist", orderImplement.getOrder() );
			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Boolean test = false;
		
		LoginAction loginAction = new LoginAction();
		conn = DBUtility.getConnection();
		String Username = request.getParameter( "Username" );
		String Password = request.getParameter( "Password" );
		int LoginID = loginAction.loginUser(Username, Password);
		
		//This is a test
		//SendEmail sendEmail = new SendEmail();
		//sendEmail.send("fajardokier@yahoo.com", "Bitch ass nigga", "<br>This is a Holdup,<br>.I'mma pop a cap in your ass");
		
		RequestDispatcher view;
		//String test = (String) session.getAttribute("username");
		if (LoginID > 0) {
			HttpSession session = request.getSession();
			
			//Set ID
			session.setAttribute("userID", LoginID);
			
			//Set Username
			LoginImplement LoginImp = new LoginImplement();
			Login login = LoginImp.getLoginByID(LoginID);
			session.setAttribute("username", login.getUsername());
			//Set Access Level
			int AL = loginAction.checkUserType(LoginID);
			session.setAttribute("userAccess", AL);

			
			if (AL == 1) {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			} else if (AL == 2) {
				view = request.getRequestDispatcher( "/DeliveryPersonel.jsp" );
				view.forward(request, response);
			} else if (AL == 3) {
				PharmacistImplement pharmacistImplement = new PharmacistImplement();
				response.sendRedirect(request.getContextPath() + "/PurchaseController?PharmaID=" + pharmacistImplement.getPharmacistByUserId(LoginID).getBranchID());
			} else if (AL == 4) {
				view = request.getRequestDispatcher( "/AdminHome.jsp" );
				view.forward(request, response);
			} else {
				view = request.getRequestDispatcher( "/Error.jsp" );
				view.forward(request, response);
			}
		}
		else {
			view = request.getRequestDispatcher( "/AccountRecovery.jsp" );
			view.forward(request, response);
		}
	}
}
