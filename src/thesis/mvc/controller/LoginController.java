package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.faces.bean.ManagedProperty;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.pageaction.LoginAction;
import thesis.mvc.utility.DBUtility;

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
		boolean test = loginAction.loginUser(request.getParameter( "Username" ), request.getParameter( "Password" ));
		
		RequestDispatcher view;
		if (test) {
			view = request.getRequestDispatcher( "/Sucess.jsp" );
		}
		else {
			view = request.getRequestDispatcher( "/Fail.jsp" );
		}
		view.forward(request, response);
	}
}
