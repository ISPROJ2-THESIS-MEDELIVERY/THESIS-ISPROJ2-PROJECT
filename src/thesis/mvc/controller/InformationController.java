package thesis.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import thesis.mvc.implement.CityListingImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.model.Branch;
import thesis.mvc.model.CourierService;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;

@WebServlet("/InformationController")
@MultipartConfig
public class InformationController extends HttpServlet {
	
	private Connection conn;
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public InformationController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	//private final String UPLOAD_DIRECTORY = "../../../../../../../../THESIS-ISPROJ2-PROJECT/WebContent/images/";
	private final String UPLOAD_DIRECTORY = "/C:/ISPROJ2/Medelivery/webapp/images/";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Action = request.getParameter("Action");
		session.setAttribute("CityList", new CityListingImplement().getAllCityListing() );
		
		if(Action.equalsIgnoreCase("???")) {
		//Add Other items
		} else if (Action.equalsIgnoreCase("AddBranch")){
			session.setAttribute("PharmacyList", new PharmacyImplement().getAllPharmacys() );
			response.sendRedirect(request.getContextPath() + "/addBranch.jsp");
		} else if (Action.equalsIgnoreCase("AddCourier")){
			response.sendRedirect(request.getContextPath() + "/addCourier.jsp");
		} else if (Action.equalsIgnoreCase("AddPharmacy")){
			response.sendRedirect(request.getContextPath() + "/addPharmacy.jsp");
		
		//Insert/Add Product
		} else if (Action.equalsIgnoreCase("InsertProduct")){
			int pharmacyID = new BranchImplement().getBranchById(new PharmacistImplement().getPharmacistById((int) session.getAttribute("Pharmacist")).getBranchID()).getPharmacyID();
			List<Product> Products = new ArrayList<Product>();
			Products = new ProductImplement().getAllProducts();
			
			session.setAttribute("ProductList", Products );
			session.setAttribute("currentStock", new StocksImplement().getStocksByPharmacy(pharmacyID));
			response.sendRedirect(request.getContextPath() + "/insertProduct.jsp");
		} else if (Action.equalsIgnoreCase("InsertNewProduct")){
			response.sendRedirect(request.getContextPath() + "/insertNewProduct.jsp");
		
		//Fall Back
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegistrationAction Registration = new RegistrationAction();
		Boolean test = false;
		conn = DBUtility.getConnection();
		String forward;

		String Action = request.getParameter( "Actionthing" );
		System.out.println(Action);
		
		if (Action.equalsIgnoreCase("sakdfdsjf")) {
			session.setAttribute("CapchaFail", true);
			//response.sendRedirect(request.getContextPath() + "/RegistrationCustomer.jsp");
		} else if (Action.equalsIgnoreCase("addPharmacy")) { //Pharmacy
			String PharName = request.getParameter( "PharmaName" );
			String PharFile = "";

			if(ServletFileUpload.isMultipartContent(request)){
	            try {

	            	Part filePart = request.getPart("PharmaLogo");
					String name = PharName+"Logo";
					String end = filePart.getContentType();
					if (end.startsWith("image")) {
						String imageType = end.replace("image/", "");
						name = name + "." + imageType;
						String DbaseName = new EncryptionFunction().encrypt(name);
						PharFile = DbaseName;
						String AFileName = name;
						filePart.write(UPLOAD_DIRECTORY + File.separator + AFileName);
						System.out.println( "File Uploaded Successfully: " + UPLOAD_DIRECTORY + File.separator + AFileName);
					} else {
						System.out.println( "File Uploaded is not an image!");
					}
	            	
	            } catch (Exception ex) {
	            	System.out.println( "File Upload Failed due to " + ex);
	            }
	            
	        }
			Pharmacy pharmacy = new Pharmacy();
			pharmacy.setPharmacyName(PharName);
			pharmacy.setPharmacyLogo(PharFile);
			new PharmacyImplement().addPharmacy(pharmacy);
		} else if (Action.equalsIgnoreCase("addBranch")) { //Branch
			String BrchStrt = request.getParameter( "BrchStrt" );
			String BrchBngy = request.getParameter( "BrchBngy" );
			int	BrchCity = Integer.parseInt( request.getParameter( "BrchCity" ) );
			String BrchProv = request.getParameter( "BrchProv" );
			String BrchLand = request.getParameter( "BrchLand" );
			String BrchCell = request.getParameter( "BrchCell" );
			String BrchOwnr = request.getParameter( "BrchOwnr" );
			int BrchPHID = Integer.parseInt( request.getParameter( "BrchPHID" ) );
			Branch branch = new Branch();
			branch.setBranchStreet( BrchStrt );
			branch.setBranchBarangay( BrchBngy );
			branch.setCityID( BrchCity );
			branch.setBranchProvince( BrchProv );
			branch.setBranchLandline( BrchLand );
			branch.setBranchCellular( BrchCell );
			branch.setBranchOwner( BrchOwnr );
			branch.setPharmacyID( BrchPHID );
			branch.setBranchAvailable( true );
			new BranchImplement().addBranch(branch);
		} else if (Action.equalsIgnoreCase("addCourier")) { //Courier
			String CompName = request.getParameter( "CompName" );
			String CompStre = request.getParameter( "CompStre" );
			String CompBara = request.getParameter( "CompBara" );
			String CompCity = request.getParameter( "CompCity" );
			String CompProv = request.getParameter( "CompProv" );
			BigInteger CompCell = new BigInteger(request.getParameter( "CompCell" ));
			int CompLand = Integer.parseInt(request.getParameter( "CompLand" ));
			String CompCont = request.getParameter( "CompCont" );
			Date DateAded = new Date(Calendar.getInstance().getTime().getTime());
			CourierService courierService = new CourierService();
			courierService.setCompanyName( CompName );
			courierService.setCompanyStreet( CompStre );
			courierService.setCompanyBarangay( CompBara );
			courierService.setCompanyCity( CompCity );
			courierService.setCompanyProvince( CompProv );
			courierService.setCompanyCellular( CompCell );
			courierService.setCompanyLandline( CompLand );
			courierService.setCompanyContact( CompCont );
			courierService.setDateAdded( DateAded );
			new CourierServiceImplement().addCourierService( courierService );
		} else if (Action.equalsIgnoreCase("SSIDApprove")) {
			int CID = Integer.valueOf( request.getParameter( "customerID" ) );
			Customer customer = new CustomerImplement().getCustomerById(CID);
			customer.setIsSeniorCitizen(true);
			new CustomerImplement().updateCustomer(customer);
		} else if (Action.equalsIgnoreCase("SSIDReject")) {
			int CID = Integer.valueOf( request.getParameter( "customerID" ) );
			Customer customer = new CustomerImplement().getCustomerById(CID);
			customer.setSeniorCitizenID(null);;
			new CustomerImplement().updateCustomer(customer);
		} else if (Action.equalsIgnoreCase("update")) {//Admin
			//Parameter to Variable
			//Get CID
			Login login = new LoginImplement().getLoginByID((int)session.getAttribute("userID"));
			String Username = request.getParameter("Username").equalsIgnoreCase("") ? request.getParameter( "Username" ) : login.getUsername();
			String Password = request.getParameter("Password").equalsIgnoreCase("") ? request.getParameter( "Password" ) : login.getPassword();
			
			login.setUsername(Username);
			login.setPassword(new EncryptionFunction().encrypt(Password));
			new LoginImplement().updateLogin(login);
			
			if ((int) session.getAttribute("userAccess") == 1) {
				Customer customer = new CustomerImplement().getCustomerById((int) session.getAttribute("Customer"));
				String CustName = request.getParameter( "FullName" ).equalsIgnoreCase("") ? request.getParameter( "FullName" ) : customer.getCustomerName();
				String CustStrt = request.getParameter( "CuStreet" ).equalsIgnoreCase("") ? request.getParameter( "CuStreet" ) : customer.getCustomerStreet();
				String CustBrgy = request.getParameter( "CuBarngy" ).equalsIgnoreCase("") ? request.getParameter( "CuBarngy" ) : customer.getCustomerBarangay();
				int CustCity =    request.getParameter( "CCityID" ).equalsIgnoreCase("") ? Integer.parseInt(request.getParameter( "CCityID" )) : customer.getCityID();
				String CustCell = request.getParameter( "CuCellul" ).equalsIgnoreCase("") ? request.getParameter( "CuCellul" ) : customer.getCustomerCellular();
				String CustLand = request.getParameter( "CuLandLi" ).equalsIgnoreCase("") ? request.getParameter( "CuLandLi" ) : customer.getCustomerLandline();
				String CustEmil = request.getParameter( "CusEmail" ).equalsIgnoreCase("") ? request.getParameter( "CusEmail" ) : customer.getEmail();
				
				//Initial Information
				customer.setCustomerName(CustName);
				customer.setCustomerStreet(CustStrt);
				customer.setCustomerBarangay(CustBrgy);
				customer.setCityID(CustCity);
				customer.setCustomerCellular(CustCell);
				customer.setCustomerLandline(CustLand);
				customer.setEmail(CustEmil);
				
				new CustomerImplement().updateCustomer(customer);
				
			}
			
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
}
