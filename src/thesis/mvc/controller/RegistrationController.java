package thesis.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import thesis.mvc.implement.AdminImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.model.Admin;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.model.Login;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.pageaction.LoginAction;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;
import thesis.mvc.utility.SendEmail;

@WebServlet("/RegistrationController")
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
maxFileSize = 10485760L, // 10 MB
maxRequestSize = 20971520L // 20 MB
)
public class RegistrationController extends HttpServlet {
	
	private Connection conn;
	private static final String UPLOAD_DIR = "images";
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public RegistrationController() {
		conn = DBUtility.getConnection();
	}
	
	private RegistrationAction Registration = new RegistrationAction();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ConfirmID = request.getParameter("UserID");
		
		String forward = "";
		
		if (ConfirmID != null) {
			LoginImplement loginImplement = new LoginImplement();
			int ID = Integer.parseInt(new EncryptionFunction().encrypt(ConfirmID));
			if (loginImplement.getLoginByID(ID).getLoginStatus().equalsIgnoreCase("Just Registered")) {
				loginImplement.ConfirmLogin(ID);				
			}

			forward = "/Login.jsp";
		} else if (true){
			forward = "";//page to the admin's registration
		} else {
			forward = "";//page to the customer's registration
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);

		
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

		//CAPCHA
		boolean Capcha = true;//request.getParameter( "CapchaRegistration" ) == "true";
		
		//Check if passwords match
		if (Password != PassRept)
		{
			//response.sendRedirect(request.getContextPath() + "/RegistrationCustomer.jsp");
		}
		
		//Input the login variables
		Login login = new Login();
		login.setUsername( Username );
		login.setPassword( Password );
		
		//Image Saving Start
		if (!Capcha) {
			session.setAttribute("CapchaFail", true);
			//response.sendRedirect(request.getContextPath() + "/RegistrationCustomer.jsp");
		} else if (secretCode == null) { //Customer
			//Parameter to Variable
			String customerFName = request.getParameter( "FullName" );
			String customerAddrs = request.getParameter( "CAddress" );
			String customerEMail = request.getParameter( "CusEmail" );
			String customerConNo = request.getParameter( "ContactNumber" );
			
			//Initial Information
			Customer customer = new Customer();
			customer.setCustomerName( customerFName );
			customer.setAddress( customerAddrs );
			customer.setEmail( customerEMail );
			customer.setContactNumber( Integer.parseInt( customerConNo ) );
			customer.setIsSeniorCitizen(false); //This is temporary
			
			//Registration
			int ID = Registration.makeCustomer(login, customer);
			//Email of Confirmation
			SendEmail sendEmail = new SendEmail();
			
			String confirmLink = "http://localhost:8080/" + request.getContextPath() + "/RegistrationController?UserID=" + new EncryptionFunction().encrypt(Integer.toString(ID));
			sendEmail.send(customer.getEmail(), "Medilivery Account Confirmation",
					"Dear " + customerFName + "," +  
					"<p>Thank you for creating your Medelivery Account.<br></p>" + 
					"<p>To complete your registration, click the link below:<br>" + 
					"<a href=\"" + confirmLink + "\" target=\"_blank\" data-saferedirecturl=\"\"><span class=\"il\">Confirm</span> your account</a></p>" + 
					"<p>Yours truly,</p><br>" + 
					"<p>Medelivery Admin Team</p>" + 
					"The Medelivery Team Thanks you for your patronage");
			response.sendRedirect(request.getContextPath() + "/index.jsp");

		} else if (secretCode.equalsIgnoreCase( "i3Up8XmH04Jz151")) {//Admin
			//Parameter to Variable
			String FistName = request.getParameter( "FistName" );
			String LastName = request.getParameter( "LastName" );
			
			//Inital Information
			Admin admin = new Admin();
			admin.setFirstName( FistName );
			admin.setSurname( LastName );
			test = Registration.makeAdmin(login, admin);
		}
		
		if(test){
			forward = "/login.jsp";//"/RegistrationSuccess.jsp";
		} else {
			forward = "/AccountRecovery.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
}
