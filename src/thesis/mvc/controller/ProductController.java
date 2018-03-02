package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductController {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher( "/Home.jsp" );
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String forward = "";
		String action = request.getParameter( "action" );
		if( request.getParameter( "Selection" ) != null ) {//Goto product page
			forward = lIST_CUSTOMER;
			int customerId = Integer.parseInt( request.getParameter("customerId") );
			dao.deleteCustomer(customerId);
			request.setAttribute("customers", dao.getAllCustomers() );
		}else { //Goto main page
			forward = lIST_CUSTOMER;
			request.setAttribute("customers", dao.getAllCustomers() );
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
		RequestDispatcher view;
		view = request.getRequestDispatcher( "/invalidError.jsp" );
		//request.setAttribute("customers", dao.getAllCustomers());
		view.forward(request, response);
	}

}
