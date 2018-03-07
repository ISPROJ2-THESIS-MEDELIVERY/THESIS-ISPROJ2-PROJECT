package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.pageaction.EmailAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/LocationController")
public class LocationController extends HttpServlet {
	
	private Connection conn;

	public LocationController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int productID = Integer.parseInt( request.getParameter( "ProductID" ) );
		RequestDispatcher view = request.getRequestDispatcher( "/Home.jsp" );
		view.forward(request, response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
	}

}
