package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.faces.bean.ManagedProperty;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int LoginID = loginAction.loginUser(request.getParameter( "Username" ), request.getParameter( "Password" ));
		
		RequestDispatcher view;
		if (LoginID > 0) {
			HttpSession session = request.getSession();
			//
			session.setAttribute("userID", LoginID);
			
			session.setAttribute("username", "Trinidad");
			session.setAttribute("userAccess", 1);
			String test = (String) session.getAttribute("username");
			
			view = request.getRequestDispatcher( "/AdminHome.jsp" );
		}
		else {
			view = request.getRequestDispatcher( "/AccountRecovery.jsp" );
		}
		view.forward(request, response);
	}
}
