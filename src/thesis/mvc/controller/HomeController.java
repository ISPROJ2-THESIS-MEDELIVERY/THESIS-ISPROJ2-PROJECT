package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.dataobjects.*;
import thesis.mvc.implement.*;

public class HomeController {

	private ProductDAO pdao;
	private StocksDAO sdao;
	private static final long serialVersionUID = 1L;
	public static final String HOMEPAGE = "/Home.jsp";
	public static final String INSERT_OR_EDIT = "/Customer.jsp";
	
	public HomeController() {
		pdao = new ProductImplement();
		sdao = new StocksImplement();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter( "action" );
		/*if( action.equalsIgnoreCase( "delete" ) ) {
			forward = HOMEPAGE;
			int customerId = Integer.parseInt( request.getParameter("customerId") );
			pdao.deleteCustomer(Id);
			request.setAttribute("customers", dao.getAllCustomers() );
		}
		else if( action.equalsIgnoreCase( "edit" ) ) {
			forward = INSERT_OR_EDIT;
			int customerId = Integer.parseInt( request.getParameter("customerId") );
			Customer customer = dao.getCustomerById(customerId);
			request.setAttribute("customer", customer);
		}
		else */if( action.equalsIgnoreCase( "insert" ) ) {
			forward = INSERT_OR_EDIT;
		}
		else {
			forward = HOMEPAGE;
			request.setAttribute("products", pdao.getAllProducts() );
			request.setAttribute("stocks", sdao.getAllStocks() );
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new Customer();
		customer.setFirstName( request.getParameter( "firstName" ) );
		customer.setLastName( request.getParameter( "lastName" ) );
		customer.setMiddleName( request.getParameter( "middleName" ) );
		customer.setCreditCardNo( Double.parseDouble( request.getParameter( "creditCardNo" ) ) );
		customer.setBillingStreet( request.getParameter( "billingStreet" ) );
		customer.setBillingAddress( request.getParameter( "billingAddress" ) );
		customer.setPhoneNo( Integer.parseInt( request.getParameter( "phoneNo" ) ) );
		String customerId = request.getParameter("customerId");
		
		RequestDispatcher view;
		boolean test = luhnTest( request.getParameter( "creditCardNo" ) );
		if(!test){
			customer.setCreditCardNo( 0 );
			view = request.getRequestDispatcher( "/invalidError.jsp" );
		} else if( customerId == null || customerId.isEmpty() ) {
			dao.addCustomer(customer);
			view = request.getRequestDispatcher( lIST_CUSTOMER );
		} else {
			customer.setCustomerId( Integer.parseInt(customerId) );
			dao.updateCustomer(customer);
			view = request.getRequestDispatcher( lIST_CUSTOMER );
		}
		request.setAttribute("customers", dao.getAllCustomers());
		view.forward(request, response);
	}
	*/
}
