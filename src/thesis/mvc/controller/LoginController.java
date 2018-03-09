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

import thesis.mvc.implement.LoginImplement;
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
		String forward = "";
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Boolean test = false;
		
		LoginAction loginAction = new LoginAction();
		conn = DBUtility.getConnection();
		String Username = request.getParameter( "Username" );
		String Password = request.getParameter( "Password" );
		int LoginID = loginAction.loginUser(Username, Password);
		
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
			view = request.getRequestDispatcher( "/A-test-loginsuccess.jsp" );
			/*if (AL == 1) {
				view = request.getRequestDispatcher( "/CustomerHome.jsp" );
			} else if (AL == 2) {
				view = request.getRequestDispatcher( "/DispatcherHome.jsp" );
			} else if (AL == 3) {
				view = request.getRequestDispatcher( "/PharmacistHome.jsp" );
			} else if (AL == 4) {
				view = request.getRequestDispatcher( "/AdminHome.jsp" );
			} else {
				view = request.getRequestDispatcher( "/Error.jsp" );
			}*/
		}
		else {
			view = request.getRequestDispatcher( "/AccountRecovery.jsp" );
		}
		view.forward(request, response);
	}
}
