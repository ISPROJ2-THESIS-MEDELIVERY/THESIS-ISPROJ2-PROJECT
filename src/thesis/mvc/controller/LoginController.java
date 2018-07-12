package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.model.Login;
import thesis.mvc.pageaction.LoginAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public LoginController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward;
		HttpSession session = request.getSession();
		
		if ((int) session.getAttribute("userID") > 0) {
			LoginAction loginAction = new LoginAction();
			loginAction.logoutUser((int)session.getAttribute("userID"), (String)session.getAttribute("username"));
			session.removeAttribute("userID");
			session.removeAttribute("username");
			session.removeAttribute("userAccess");
			if(session.getAttribute("PharmaID") == null) {
				session.removeAttribute("PharmaID");
			}
			
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
		LoginAction loginAction = new LoginAction();
		conn = DBUtility.getConnection();
		String Username = request.getParameter( "Username" );
		String Password = request.getParameter( "Password" );
		int LoginID = loginAction.loginUser(Username, Password);
		
		RequestDispatcher view;
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

			switch(AL) {
			case 1: //Customer
				CustomerImplement customerImplement = new CustomerImplement();
				int CID = customerImplement.getCustomerByUserId(LoginID).getCustomerID();
				session.setAttribute("CustomerID", CID);
				break;
			case 2: //Dispatcher
				//response.sendRedirect(request.getContextPath() + "/DispatcherController" );
				break;
			case 3: //Pharmacist
				/*
				PharmacistImplement pharmacistImplement = new PharmacistImplement();
				session.setAttribute("PharmaID", pharmacistImplement.getPharmacistByUserId(LoginID).getBranchID());
				response.sendRedirect(request.getContextPath() + "/PurchaseController");
				*/
				break;
			case 4: //Admin
				/*
				view = request.getRequestDispatcher( "/AdminHome.jsp" );
				view.forward(request, response);
				*/
				break;
			}

			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		else {
			view = request.getRequestDispatcher( "/AccountRecovery.jsp" );
			view.forward(request, response);
		}
	}
}
