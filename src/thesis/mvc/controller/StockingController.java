package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.utility.DBUtility;

@WebServlet("/StockingController")
public class StockingController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public StockingController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		
		//Find a way to adda dropdown for the pharmacy
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Add products to the thing
		String Action = request.getParameter( "DoWhat" );
		if (Action == "NewPrice") { //Change the price of the stock
			
		} else if (Action == "NewStock") { //Pharmacy has new product that they can sell.
			
		} else { //New Product
			
		}
	}
}
