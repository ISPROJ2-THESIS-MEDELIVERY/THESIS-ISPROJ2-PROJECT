package thesis.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PrescriptionImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.model.Prescription;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.pageaction.SearchAction.ProductList;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;

@WebServlet("/ProductController")
@MultipartConfig
public class ProductController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public ProductController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "/C:/ISPROJ2/Medelivery/webapp/images/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String forward = "";
		HttpSession session = request.getSession();
		session.removeAttribute("Message");
		
		String Action = request.getParameter( "Action" );

    	//EmailAction emailAction = new EmailAction();
    	//emailAction.sendEmail("fajardokier@yahoo.com", "Bitch ass nigga", "I'mma pop a cap in your ass");
		Pharmacist pharmacist = new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") );
		int PharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
		
		if( Action.equals(null) ) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(Action.equalsIgnoreCase( "addProduct" )){ //Goto main page
			//Action=addProduct

			List<Product> productList = new ArrayList<Product>();
			productList = new ProductImplement().getAllProducts();
			System.out.println(productList.size());

			List<Stocks> stockexisting = new ArrayList<Stocks>();
			stockexisting = new StocksImplement().getStocksByPharmacy(PharmaID);
			
			//Works better than expected, this automaticaly checks the next iteration due to how lists work
			for (int ProductInt = 0; ProductInt <= productList.size(); ProductInt++){
				System.out.println("LOOP " + ProductInt);
				System.out.println("SIZE " + productList.size());
				
				int Start, End;
				do {
					Start = productList.size();
					System.out.println("Start:  " + Start);
					for (Stocks stocks : stockexisting) {
						System.out.println("LOOP " + ProductInt);
						System.out.println("SIZE " + productList.size());
						if (ProductInt >= productList.size()) {break;}
						System.out.println("CURRENTLY INSPECTING: " + productList.get(ProductInt).getProductID() + " AGAINST " + stocks.getProductID() +  " With List size: " + productList.size());
						if (productList.get(ProductInt).getProductID() == stocks.getProductID()) {
							System.out.println("REMOVED PRODUCT: " + productList.get(ProductInt).getProductName() + " ID: " + productList.get(ProductInt).getProductID() + "|||"+ productList.remove(productList.get(ProductInt)));
						} else {
							System.out.println("SKIPED PRODUCT: " + productList.get(ProductInt).getProductName() + " ID: " + productList.get(ProductInt).getProductID());
						}
					}
					End = productList.size();
					System.out.println("End: " + End);
				} while (Start != End);
			}
			
			
			
			session.setAttribute("ProductList", productList);
			response.sendRedirect(request.getContextPath() + "/pharmacyStock.jsp");
		} else if(Action.equalsIgnoreCase( "AddnewProduct" )){ //Goto main page
		   	session.setAttribute( "pharmaProductList", new SearchAction().GeneralListing(PharmaID) );
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
		session.removeAttribute("Message");

		if( Action.equals(null) ) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if (Action.equalsIgnoreCase("addStock")) { //Stock
			//Variables
			Pharmacist pharmacist = new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") );
			int PharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
			int ProductID = Integer.parseInt(request.getParameter("ProductAdd"));
			double Price = Double.parseDouble( request.getParameter("Price"));
			boolean Feat = Boolean.valueOf(request.getParameter("feature"));
			if (new ProductImplement().getProductById(ProductID).isRXProduct() == true)
			{	Feat = false;	}
			//Add to stock
			Stocks stocks = new Stocks();
			stocks.setPharmacyID(PharmaID);
			stocks.setProductID(ProductID);
			stocks.setFeature(Feat);
			int StockID = new StocksImplement().addStocks(stocks);
			System.out.println(StockID);
			//Add to stock Prices
			StocksPrice stocksPrice = new StocksPrice();
			stocksPrice.setIsCurrent(true);
			stocksPrice.setStockID(StockID);
			stocksPrice.setDateSet(CurrentDate);
			stocksPrice.setPriceSet(Price);
			int test = new StocksPriceImplement().addStocksPrice(stocksPrice);
			System.out.println(test);
			
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
			String ProductImag = "";
			boolean ProductIsRX = Boolean.valueOf(request.getParameter("ProductIsRX"));
			System.out.println("IS RX: " + ProductIsRX);
			int ProductLimt = 0;//Integer.parseInt(request.getParameter("ProductLimt"));
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
			product.setRXProduct(ProductIsRX);
			product.setCounterLimit(ProductLimt);
			int ProductID = new ProductImplement().addProduct(product);
			product.setProductID(ProductID);
			if(ServletFileUpload.isMultipartContent(request)){
	            try {

	            	Part filePart = request.getPart("ProductImag");
					String name = "Product" + ProductID;
					//String end = filePart.getContentType();
					String end = filePart.getContentType();
					if (end.startsWith("image")) {
						String imageType = end.replace("image/", "");
						name = name + "." + imageType;
						String DbaseName = new EncryptionFunction().encrypt(name);
						ProductImag = DbaseName;
						String AFileName = name;
				        //System.out.println(UPLOAD_DIRECTORY + File.separator + AFileName + "." + imageType);
				        //System.out.println(UPLOAD_DIRECTORY +"|"+ File.separator +"|"+ AFileName +"|"+ "." +"|"+ imageType);
						filePart.write(UPLOAD_DIRECTORY + File.separator + AFileName);
						System.out.println( "File Uploaded Successfully: " + UPLOAD_DIRECTORY + File.separator + AFileName);
					} else {
						System.out.println( "File Uploaded is not an image!");
					}
	            	
	            } catch (Exception ex) {
	            	System.out.println( "File Upload Failed due to " + ex);
	            }
	            
	        }
			product.setProductImage( ProductImag );
			new ProductImplement().updateProduct(product);
			System.out.println("PRODUCT ID: " + ProductID);
			//Add to stock
			Pharmacist pharmacist = new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") );
			int PharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
			double Price = Double.parseDouble( request.getParameter("Price"));
			boolean Feat = Boolean.valueOf(request.getParameter("feature"));
			System.out.println("FEATURE: " + Feat);
			Stocks stocks = new Stocks();
			stocks.setPharmacyID( PharmaID );
			stocks.setProductID(ProductID);
			stocks.setFeature(Feat);
			int StockID = new StocksImplement().addStocks(stocks);
			System.out.println("STOCK ID: " + StockID);
			//Add to stock Prices
			StocksPrice stocksPrice = new StocksPrice();
			stocksPrice.setIsCurrent(true);
			stocksPrice.setStockID(StockID);
			stocksPrice.setDateSet(CurrentDate);
			stocksPrice.setPriceSet(Price);
			int test = new StocksPriceImplement().addStocksPrice(stocksPrice);
			System.out.println("PRODUCT ID: " + test);
		}
		session.setAttribute("Message", "The product has been successfully added");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
	}

}
