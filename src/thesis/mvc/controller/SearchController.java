package thesis.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.utility.DBUtility;

public class SearchController {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Product> Results;
    	SearchAction Search = new SearchAction();
		Login login = new Login();
		int searchfilter = Integer.parseInt(request.getParameter( "ContactNumber" ));
		
		Results = Search.ProductListing(searchfilter);
		
		RequestDispatcher view = request.getRequestDispatcher( "/index.jsp" );
		view.forward(request, response);
	}

}
