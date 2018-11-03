package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.model.StocksPrice;
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
		//String forward = "";
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
		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
		String Action = request.getParameter( "Action" );
		HttpSession session = request.getSession();
		
		if( Action.isEmpty() ) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if (Action.equalsIgnoreCase("addStock")) { //Stock
			//Variables
			Pharmacist pharmacist = (Pharmacist) session.getAttribute("Pharmacist");
			int PharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
			int ProductID = Integer.parseInt(request.getParameter("ProductAdd"));
			double Price = Double.parseDouble( request.getParameter("Price"));
			boolean Feat = Boolean.parseBoolean(request.getParameter("feature"));
			//Add to stock
			Stocks stocks = new Stocks();
			stocks.setPharmacyID( PharmaID );
			stocks.setProductID(ProductID);
			stocks.setFeature(Feat);
			int StockID = new StocksImplement().addStocks(stocks);
			//Add to stock Prices
			StocksPrice stocksPrice = new StocksPrice();
			stocksPrice.setIsCurrent(true);
			stocksPrice.setStockID(StockID);
			stocksPrice.setDateSet(CurrentDate);
			stocksPrice.setPriceSet(Price);
			new StocksPriceImplement().addStocksPrice(stocksPrice);
		} else if (Action.equalsIgnoreCase("addProduct")) { //Product
			//Variables
			String ProductName = request.getParameter("ProductName");
			String GenericName = request.getParameter("GenericName");
			String RegistrNumn = request.getParameter("RegistrNumn");
			String ProductStrg = request.getParameter("ProductStrg");
			String ProductForm = request.getParameter("ProductForm");
			String ProductPack = request.getParameter("ProductPack");
			String ProductManu = request.getParameter("ProductManu");
			String ProductOrgi = request.getParameter("ProductOrgi");
			String ProductDesc = request.getParameter("ProductDesc");
			String ProductImag = request.getParameter("ProductImag");
			boolean ProductIsRX = Boolean.getBoolean(request.getParameter("ProductIsRX"));
			int ProductLimt = Integer.parseInt(request.getParameter("ProductLimt"));
			//Add Product
			Product product = new Product();
			product.setProductName( ProductName );
			product.setGenericName( GenericName );
			product.setRegistrationNo( RegistrNumn );
			product.setProductStrength( ProductStrg );
			product.setProductForm( ProductForm );
			product.setProductPackaging( ProductPack );
			product.setProductManufacturer( ProductManu );
			product.setProductOrigin( ProductOrgi );
			product.setProductDescription( ProductDesc );
			product.setProductImage( ProductImag );
			product.setRXProduct(ProductIsRX);
			product.setCounterLimit(ProductLimt);
			int ProductID = new ProductImplement().addProduct(product);
			//Add to stock
			Pharmacist pharmacist = (Pharmacist) session.getAttribute("Pharmacist");
			int PharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
			double Price = Double.parseDouble( request.getParameter("Price"));
			boolean Feat = Boolean.parseBoolean(request.getParameter("feature"));
			Stocks stocks = new Stocks();
			stocks.setPharmacyID( PharmaID );
			stocks.setProductID(ProductID);
			stocks.setFeature(Feat);
			int StockID = new StocksImplement().addStocks(stocks);
			//Add to stock Prices
			StocksPrice stocksPrice = new StocksPrice();
			stocksPrice.setIsCurrent(true);
			stocksPrice.setStockID(StockID);
			stocksPrice.setDateSet(CurrentDate);
			stocksPrice.setPriceSet(Price);
			new StocksPriceImplement().addStocksPrice(stocksPrice);
		}
		
	}

}
