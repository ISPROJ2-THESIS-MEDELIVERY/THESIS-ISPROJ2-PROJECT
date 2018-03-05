package thesis.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Login;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.FilterAction;

@WebServlet("/SearchController")
public class FilterController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Product> Results;
    	FilterAction Search = new FilterAction();
		Login login = new Login();
		int searchfilter = Integer.parseInt(request.getParameter( "SearchFilter" ));
		
		Results = Search.ProductListing(searchfilter);
		
		String link = "/FilterController?ProductID=" + "";
		RequestDispatcher view = request.getRequestDispatcher( );
		view.forward(request, response);
	}

}
