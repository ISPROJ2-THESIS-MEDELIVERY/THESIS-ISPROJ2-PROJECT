package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.utility.DBUtility;

@WebServlet("/PurchaseController")
public class PurchaseController extends HttpServlet {
	
	private Connection conn;

	public PurchaseController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	conn = DBUtility.getConnection();
		Login login = new Login();
		
		//Global variable of customer ID here.
		/*
		CustomerID
		DeliveryID
		PharmacistID
		CityID
		PrescriptionID
		OrderAddress
		DateOrdered
		DateProcessed
		DateDelivered
		OrderType
		OrderStatus
		SeniorDiscount
		PaymentMethod

		
		
		Customer customer = new Customer();
		customer.setCustomerName( request.getParameter( "CustomerName" ) );
		customer.setAddress( request.getParameter( "Address" ) );
		customer.setEmail( request.getParameter( "Email" ) );
		customer.setSeniorCitizenID( request.getParameter( "SeniorCitizenID" ) );
		customer.setContactNumber( Integer.parseInt(request.getParameter( "ContactNumber" )) );
		
		Boolean test = Registration.makeCustomer(login, customer);
		*/
		RequestDispatcher view;
		if(test){
			view = request.getRequestDispatcher( "/index.jsp" );
		} else {
			view = request.getRequestDispatcher( "/index.jsp" );
		}
		view.forward(request, response);
	}

}
