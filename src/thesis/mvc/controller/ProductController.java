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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.utility.DBUtility;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public ProductController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		HttpSession session = request.getSession();
		
		String Action = request.getParameter( "Action" );

    	//EmailAction emailAction = new EmailAction();
    	//emailAction.sendEmail("fajardokier@yahoo.com", "Bitch ass nigga", "I'mma pop a cap in your ass");
		
		if( Action.isEmpty() ) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(Action.equalsIgnoreCase( "addProduct" )){ //Goto main page
			//Action=addProduct
			session.setAttribute("ProductList", new ProductImplement().getAllProducts());
			response.sendRedirect(request.getContextPath() + "/pharmacyStock.jsp");
		} else if(Action.equalsIgnoreCase( "AddnewProduct" )){ //Goto main page
			response.sendRedirect(request.getContextPath() + "/pharmacyAdd.jsp");
		} else { //Goto main page
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		//RequestDispatcher view = request.getRequestDispatcher( forward );
		//view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productID = Integer.parseInt( request.getParameter( "ProductID" ) );
		String Action = request.getParameter( "Action" );
		HttpSession session = request.getSession();
		
		if( Action.isEmpty() ) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(Action.equalsIgnoreCase( "addProduct" )){ //Goto main page
			Stocks stock =  new Stocks();
			stock.setFeature(request.getParameter("ProductID"));
			stock.setPharmacyID(Integer.parseInt(request.getParameter("PharmacyID")));
			stock.setProductID(Integer.parseInt(request.getParameter("ProductID")));
			new StocksImplement().addStocks(stock);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(Action.equalsIgnoreCase( "AddnewProduct" )){ //Goto main page
			
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} 
		
	}

}
