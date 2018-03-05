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

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Product;
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
		int productID = Integer.parseInt( request.getParameter( "ProductID" ) );
		
		if( request.getParameter( "ProductID" ) != null ) {//Goto product page
			forward = "/ProductDescription.jsp";
			ProductImplement ProdImp = new ProductImplement();
			Product product = ProdImp.getProductById(productID);
			request.setAttribute( "product", product );
		}else { //Goto main page
			forward = "/error.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
