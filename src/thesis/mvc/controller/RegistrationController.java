package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	
	private Connection conn;

	public RegistrationController() {
		conn = DBUtility.getConnection();
	}
	
	private RegistrationAction Registration = new RegistrationAction();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean test;
		
		conn = DBUtility.getConnection();
		Login login = new Login();
		login.setUsername( request.getParameter( "Username" ) );
		login.setPassword( request.getParameter( "Password" ) );

		Customer customer = new Customer();
		customer.setCustomerName( request.getParameter( "CustomerName" ) );
		customer.setAddress( request.getParameter( "Address" ) );
		customer.setEmail( request.getParameter( "Email" ) );
		customer.setSeniorCitizenID( request.getParameter( "SeniorCitizenID" ) );
		customer.setContactNumber( Integer.parseInt(request.getParameter( "ContactNumber" )) );
		
		test = Registration.makeCustomer(login, customer);
		
		RequestDispatcher view;
		if(test){
			view = request.getRequestDispatcher( "/index.jsp" );
		} else {
			view = request.getRequestDispatcher( "/index.jsp" );
		}
		view.forward(request, response);
	}
}
