package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Admin;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.model.Login;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public RegistrationController() {
		conn = DBUtility.getConnection();
	}
	
	private RegistrationAction Registration = new RegistrationAction();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean IDcheck = false;
		String forward = "";
		
		if (IDcheck){
			forward = "";//page to the admin's registration
		} else {
			forward = "";//page to the customer's registration
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean test = false;
		conn = DBUtility.getConnection();

		RequestDispatcher view;
		if (request.getParameter( "Password" ) != request.getParameter( "Password-repeat" ))
		{
			view = request.getRequestDispatcher( "/index.jsp" );
			view.forward(request, response);
		}
		
		Login login = new Login();
		login.setUsername( request.getParameter( "Username" ) );
		login.setPassword( request.getParameter( "Password" ) );
		String secretCode = request.getParameter( "SecretCode" );
		
		if (secretCode == "i3Up8XmH04Jz151") {//Admin
			Admin admin = new Admin();
			admin.setUserID( Integer.parseInt( request.getParameter( "UserID" ) ) );
			admin.setFirstName( request.getParameter( "FirstName" ) );
			admin.setSurname( request.getParameter( "SurName" ) );
			test = Registration.makeAdmin(login, admin);
			
		} else if (secretCode == "5WLjE4Hik2TC85l") {//Dispatcher
			Dispatcher dispatcher = new Dispatcher();
			dispatcher.setCourierServiceID( Integer.parseInt( request.getParameter( "CourierServiceID" ) ) );
			dispatcher.setUserID( Integer.parseInt( request.getParameter( "UserID" ) ) );
			dispatcher.setFirstName( request.getParameter( "FirstName" ) );
			dispatcher.setLastName( request.getParameter( "LastName" ) );
			dispatcher.setContactNumber( Integer.parseInt( request.getParameter( "ContactNumber" ) ) );
			dispatcher.setAddress( request.getParameter( "Address" ) );
			dispatcher.setBirthdate( Date.valueOf( request.getParameter( "Birthdate" ) ) );
			test = Registration.makeDispatcher(login, dispatcher);
			
		} else if (secretCode == "RjRILW7K7Xz96hD") {//Pharmacist
			Pharmacist pharmacist = new Pharmacist();
			pharmacist.setBranchID( Integer.parseInt( request.getParameter( "BranchID" ) ) );
			pharmacist.setFirstName( request.getParameter( "FirstName" ) );
			pharmacist.setLastName( request.getParameter( "LastName" ) );
			pharmacist.setPRCNo( Integer.parseInt( request.getParameter( "PRCNo" ) ) );
			pharmacist.setPosition( request.getParameter( "Position" ) );
			test = Registration.makePharmacist(login, pharmacist);
			
		} else {
			Customer customer = new Customer();
			customer.setCustomerName( request.getParameter( "FullName" ) );
			customer.setAddress( request.getParameter( "CAddress" ) );
			customer.setEmail( request.getParameter( "CusEmail" ) );
			customer.setContactNumber( Integer.parseInt(request.getParameter( "ContactNumber" )) );
			customer.setSeniorCitizenID( request.getParameter( "SeniorCitizenID" ) );
			test = Registration.makeCustomer(login, customer);
		}
		if(test){
			view = request.getRequestDispatcher( "/RegistrationSuccess.jsp" );
		} else {
			view = request.getRequestDispatcher( "/AccountRecovery.jsp" );
		}
		view.forward(request, response);
	}
}
