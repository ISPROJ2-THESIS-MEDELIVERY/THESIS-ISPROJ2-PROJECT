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

    	//EmailAction emailAction = new EmailAction();
    	//emailAction.sendEmail("fajardokier@yahoo.com", "Bitch ass nigga", "I'mma pop a cap in your ass");
		
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
		conn = DBUtility.getConnection();
		Product product = new Product();
		
		product.setProductName(request.getParameter("ProductName"));
		product.setGenericName(request.getParameter("GenericName"));
		product.setRegistrationNo(request.getParameter("RegistrationNo"));
		product.setProductStrength(request.getParameter("ProductStrength"));
		product.setProductForm(request.getParameter("ProductForm"));
		product.setProductPackaging(request.getParameter("ProductPackaging"));
		product.setProductManufacturer(request.getParameter("ProductManufacturer"));
		product.setProductOrigin(request.getParameter("ProductOrigin"));
		product.setProductDescription(request.getParameter("ProductDescription"));
		product.setProductImage(request.getParameter("ProductImage"));
		product.setRXProduct(Boolean.getBoolean(request.getParameter("RXProduct")));
		product.setCounterLimit(Integer.getInteger(request.getParameter("CounterLimit")));
	}

}
