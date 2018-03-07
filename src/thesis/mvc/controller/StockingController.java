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

import thesis.mvc.implement.StocksImplement;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.pageaction.StockingAction;
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
		StockingAction stocking = new StockingAction();
		request.setAttribute("ListItems", stocking.listStock());
		//Find a way to add a dropdown for the pharmacy
		String forward = "/ManageInventory.jsp";
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Add products to the thing
		String forward = "";
		String Action = request.getParameter( "DoWhat" );
		if (Action == "NewPrice") { //Change the price of the stock
			StockingAction stockingAction = new StockingAction();
			int stockID = Integer.getInteger( request.getParameter( "StockID" ) );
			int newPrice = Integer.getInteger( request.getParameter( "NewPrice" ) );
			if(stockingAction.ChangePrice(stockID, newPrice)) {
				forward = "/Sucess.jsp";
			} else {
				forward = "/Fail.jsp";
			}
		} else if (Action == "NewStock") { //Pharmacy has new product that they can sell.
			Stocks stocks = new Stocks();
			stocks.setProductID( Integer.getInteger( request.getParameter( "ProductID" ) ) );
			stocks.setBranchID( Integer.getInteger( request.getParameter( "BranchID" ) ) );
			stocks.setQuantity( Integer.getInteger( request.getParameter( "Quantity" ) ) );
			stocks.setFeature( Boolean.getBoolean( request.getParameter( "NewPrice" ) ) );
			StockingAction stockingAction = new StockingAction();
			if(stockingAction.AddStock(stocks)) {
				forward = "/Sucess.jsp";
			} else {
				forward = "/Fail.jsp";
			}
		} else { //New Product
			Product product = new Product();
			product.setProductName( request.getParameter( "ProductName" ) );
			product.setGenericName( request.getParameter( "GenericName" ) );
			product.setRegistrationNo( request.getParameter( "RegistrationNo" ) );
			product.setProductStrength( request.getParameter( "ProductStrength" ) );
			product.setProductForm( request.getParameter( "ProductForm" ) );
			product.setProductPackaging( request.getParameter( "ProductPackaging" ) );
			product.setProductManufacturer( request.getParameter( "ProductManufacturer" ) );
			product.setProductOrigin( request.getParameter( "ProductOrigin" ) );
			product.setProductDescription( request.getParameter( "ProductDescription" ) );
			product.setProductImage( request.getParameter( "ProductImage" ) );
			product.setRXProduct( Boolean.getBoolean( request.getParameter( "RXProduct" ) ) );
			product.setCounterLimit( Integer.getInteger( request.getParameter( "CounterLimit" ) ) );
			StockingAction stockingAction = new StockingAction();
			if(stockingAction.AddProduct(product)) {
				forward = "/Sucess.jsp";
			} else {
				forward = "/Fail.jsp";
			}
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
}
