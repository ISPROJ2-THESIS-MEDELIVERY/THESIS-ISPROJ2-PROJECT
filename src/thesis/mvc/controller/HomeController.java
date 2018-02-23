package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Local;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.pageaction.*;

public class HomeController {

	private HomeAction Display;
	//private static final long serialVersionUID = 1L;
	public static final String HOMEPAGE = "/Home.jsp";
	
	public HomeController() {
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
			request.setAttribute("Display", Display.displayStock() );
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login login = new Login();
		Customer customer = new Customer();
		customer.set( request.getParameter( "" ) );
		customer.set( request.getParameter( "" ) );
		customer.set( request.getParameter( "" ) );
		customer.set( request.getParameter( "" ) );
		customer.set( request.getParameter( "" ) );
		customer.set( request.getParameter( "" ) );
		customer.set( Integer.parseInt( request.getParameter( "phoneNo" ) ) );
		String customerId = request.getParameter("customerId");
		
		RequestDispatcher view;
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
}
