package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.pageaction.RegistrationAction;

public class RegistrationController {
	
	private RegistrationAction Registration;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login login = new Login();
		login.setUsername( request.getParameter( "Username" ) );
		login.setPassword( request.getParameter( "Password" ) );

		Customer customer = new Customer();
		customer.setCustomerName( request.getParameter( "CustName" ) );
		customer.setAddress( request.getParameter( "CAddress" ) );
		customer.setEmail( request.getParameter( "CusEmail" ) );
		customer.setSeniorCitizenID( request.getParameter( "SenCitID" ) );
		customer.setContactNumber( Integer.parseInt(request.getParameter( "ContctNo" )) );
		
		RequestDispatcher view;
		if(Registration.makeCustomer(login, customer) == true){
			view = request.getRequestDispatcher( "/SucessPage.jsp" );
		} else {
			view = request.getRequestDispatcher( "/invalidError.jsp" );
		}
		view.forward(request, response);
	}
}
