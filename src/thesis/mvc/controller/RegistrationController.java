package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CityListingImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.model.Admin;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.model.Login;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;
import thesis.mvc.utility.SendEmail;

@WebServlet("/RegistrationController")
@MultipartConfig/*(fileSizeThreshold = 6291456, // 6 MB
maxFileSize = 10485760L, // 10 MB
maxRequestSize = 20971520L // 20 MB
)*/
public class RegistrationController extends HttpServlet {
	
	private Connection conn;
	private static final String UPLOAD_DIR = "images";
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	public RegistrationController() {
		conn = DBUtility.getConnection();
	}
	
	private RegistrationAction Registration = new RegistrationAction();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Action = request.getParameter("Action");
		session.setAttribute("CityList", new CityListingImplement().getAllCityListing() );
		
		
		String forward = "";
		
		if (Action.equalsIgnoreCase("ConfirmUser")) {
			String ConfirmID = request.getParameter("UserID");
			LoginImplement loginImplement = new LoginImplement();
			int ID = Integer.parseInt(new EncryptionFunction().decrypt(ConfirmID));
			if (loginImplement.getLoginByID(ID).getLoginStatus().equalsIgnoreCase("Just Registered")) {
				loginImplement.ConfirmLogin(ID);				
			}
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		//Add Users
		} else if (Action.equalsIgnoreCase("AddCustomer")){
			
			response.sendRedirect(request.getContextPath() + "/register.jsp");
		} else if (Action.equalsIgnoreCase("AddDispatcher")){
			
			session.setAttribute("CourierService", new CourierServiceImplement().getAllCourierService());
			response.sendRedirect(request.getContextPath() + "/registerDispatcher.jsp");
		} else if (Action.equalsIgnoreCase("AddPharmacist")){
			int PharmacyID = Integer.parseInt(request.getParameter("PharmacyID"));
			session.setAttribute("PharmacySelect", new PharmacyImplement().getPharmacyById(PharmacyID));
			session.setAttribute("PharmacyBranch", new BranchImplement().getBranchByPharmacy(PharmacyID));
			response.sendRedirect(request.getContextPath() + "/registerPharmacist.jsp");
		} else if (Action.equalsIgnoreCase("AddAdmin")){
			response.sendRedirect(request.getContextPath() + "/registerAdmin.jsp");
			
		//Add Other items
		} else if (Action.equalsIgnoreCase("AddPharmacy")){
			response.sendRedirect(request.getContextPath() + "/addPharmacy.jsp");
		} else if (Action.equalsIgnoreCase("AddBranch")){
			
			response.sendRedirect(request.getContextPath() + "/addBranch.jsp");
			
		//Fall Back
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		//RequestDispatcher view = request.getRequestDispatcher( forward );
		//view.forward(request, response);

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegistrationAction Registration = new RegistrationAction();
		Boolean test = false;
		conn = DBUtility.getConnection();
		String forward;
		
		//Parameter to Variable
		String Username = request.getParameter( "Username" );
		String Password = request.getParameter( "Password" );
		String PassRept = request.getParameter( "Password-repeat" );
		String secretCode = request.getParameter( "SecretCode" );
		System.out.println(secretCode);
		System.out.println(Password);
		System.out.println(PassRept);

		//CAPCHA
		boolean Capcha = true;//request.getParameter( "CapchaRegistration" ) == "true";
		System.out.println("Passed CAPCHA");
		//Check if passwords match
		if (!Password.equals(PassRept)) {
			System.out.println("SINKHOLE");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			System.out.println("Passed PASSWORD");
			//Input the login variables
			Login login = new Login();
			login.setUsername( Username );
			login.setPassword( new EncryptionFunction().encrypt(Password) );
			
			//Image Saving Start
			if (!Capcha) {
				session.setAttribute("CapchaFail", true);
				//response.sendRedirect(request.getContextPath() + "/RegistrationCustomer.jsp");
			} else if (secretCode == null) { //Customer
				//Parameter to Variable
				String customerFName = request.getParameter( "FullName" );
				String customerStrrt = request.getParameter( "CuStreet" );
				String customerBrngy = request.getParameter( "CuBarngy" );
				int customerCtyID = Integer.parseInt(request.getParameter( "CCityID" ));
				String customerProvi = request.getParameter( "CuProvin" );
				String customerLandL = request.getParameter( "CuLandLi" );
				String customerCellu = request.getParameter( "CuCellul" );
				String customerEMail = request.getParameter( "CusEmail" );
				
				//Initial Information
				Customer customer = new Customer();
				customer.setCustomerName( customerFName );
				customer.setCustomerStreet(customerStrrt);
				customer.setCustomerBarangay(customerBrngy);
				customer.setCityID(customerCtyID);
				customer.setCustomerProvince(customerProvi);
				customer.setCustomerLandline(customerLandL);
				customer.setCustomerCellular(customerCellu);
				customer.setEmail( customerEMail );
				customer.setIsSeniorCitizen(false); //This is temporary
				
				//Registration
				int ID = Registration.makeCustomer(login, customer);
				//Email of Confirmation
				SendEmail sendEmail = new SendEmail();
				
				//String confirmLink = "http://localhost:8080/" + request.getContextPath() + "/RegistrationController?Action=ConfirmUser&UserID=" + new EncryptionFunction().encrypt(Integer.toString(ID));
				String confirmLink = "https://isproj2a.benilde.edu.ph/Medelivery/" + request.getContextPath() + "/RegistrationController?Action=ConfirmUser&UserID=" + new EncryptionFunction().encrypt(Integer.toString(ID));
				sendEmail.send(customer.getEmail(), "Medilivery Account Confirmation",
						"Dear " + customerFName + "," +  
						"<p>Thank you for creating your Medelivery Account.<br></p>" + 
						"<p>To complete your registration, click the link below:<br>" + 
						"<a href=\"" + confirmLink + "\" target=\"_blank\" data-saferedirecturl=\"\"><span class=\"il\">Confirm</span> your account</a></p>" + 
						"<p>Yours truly,</p><br>" + 
						"<p>Medelivery Admin Team</p>" + 
						"The Medelivery Team Thanks you for your patronage");
	
			} else if (secretCode.equalsIgnoreCase( "5WLjE4Hik2TC85l" ) ) {//Dispatcher
				//Parameter To Variable
				String FistName = request.getParameter( "FistName" );
				String LastName = request.getParameter( "LastName" );
				int PhoneNum = Integer.parseInt(request.getParameter( "PhoneNum" ));
				String UAddress = request.getParameter( "UAddress" );
				Date date = null;
				try {
					java.util.Date utilDate = df.parse(request.getParameter( "BrthDate" ));
					date = new java.sql.Date(utilDate.getTime());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int CourSele = Integer.parseInt( request.getParameter( "CourSele" ) );
				
				Dispatcher dispatcher = new Dispatcher();
				dispatcher.setCourierServiceID( CourSele );
				dispatcher.setFirstName( FistName );
				dispatcher.setLastName( LastName );
				dispatcher.setContactNumber( PhoneNum );
				dispatcher.setAddress( UAddress );
				dispatcher.setBirthdate( date );
				test = Registration.makeDispatcher(login, dispatcher);
				
			} else if (secretCode.equalsIgnoreCase( "RjRILW7K7Xz96hD" ) ) {//Pharmacist
				//Parameter To Variable
				String FistName = request.getParameter( "FistName" );
				String LastName = request.getParameter( "LastName" );
				String PharNumb = request.getParameter( "PharNumb" );
				int PharSele = Integer.parseInt(request.getParameter( "PharSele" ));
				String PharPosi = request.getParameter( "PharPosi" );
				
				//Initial Information
				Pharmacist pharmacist = new Pharmacist();
				pharmacist.setBranchID( PharSele );
				pharmacist.setFirstName( FistName );
				pharmacist.setLastName( LastName );
				pharmacist.setPRCNo( PharNumb );
				pharmacist.setPosition( PharPosi );
				test = Registration.makePharmacist(login, pharmacist);
			} else if (secretCode.equalsIgnoreCase( "i3Up8XmH04Jz151")) {//Admin;
				System.out.println("Passed Secret Code");
				//Parameter to Variable
				String FistName = request.getParameter( "FistName" );
				String LastName = request.getParameter( "LastName" );
				
				//Initial Information
				Admin admin = new Admin();
				admin.setFirstName( FistName );
				admin.setSurname( LastName );
				test = Registration.makeAdmin(login, admin);;
				System.out.println(test);
			} else if (secretCode.equalsIgnoreCase("updateCustomer")) {//Admin
				//Parameter to Variable
				//Get CID
				
				Customer customer = new CustomerImplement().getCustomerById(1);
				
				String CustName = request.getParameter( "UpdateName" ) != null ? request.getParameter( "UpdateName" ) : customer.getCustomerName();
				String CustStrt = request.getParameter( "UpdateStrt" ) != null ? request.getParameter( "UpdateStrt" ) : customer.getCustomerStreet();
				String CustBrgy = request.getParameter( "UpdateBrgy" ) != null ? request.getParameter( "UpdateBrgy" ) : customer.getCustomerBarangay();
				int CustCity = request.getParameter( "UpdateCity" ) != null ? Integer.parseInt(request.getParameter( "UpdateCity" )) : customer.getCityID();
				String CustProv = request.getParameter( "UpdateProv" ) != null ? request.getParameter( "UpdateProv" ) : customer.getCustomerProvince();
				String CustCell = request.getParameter( "UpdateCell" ) != null ? request.getParameter( "UpdateCell" ) : customer.getCustomerCellular();
				String CustLand = request.getParameter( "UpdateLand" ) != null ? request.getParameter( "UpdateLand" ) : customer.getCustomerLandline();
				String CustEmil = request.getParameter( "UpdateEmil" ) != null ? request.getParameter( "UpdateEmil" ) : customer.getEmail();
				
				//Initial Information
				customer.setCustomerName(CustName);
				customer.setCustomerStreet(CustStrt);
				customer.setCustomerBarangay(CustBrgy);
				customer.setCityID(CustCity);
				customer.setCustomerProvince(CustProv);
				customer.setCustomerCellular(CustCell);
				customer.setCustomerLandline(CustLand);
				customer.setEmail(CustEmil);
				
				new CustomerImplement().updateCustomer(customer);
				
			}
			
			session.setAttribute("justReg", true);
			if(test){
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
		}
	}
}
