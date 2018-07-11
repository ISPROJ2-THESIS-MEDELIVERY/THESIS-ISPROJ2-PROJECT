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
import javax.servlet.http.Part;

import thesis.mvc.implement.LoginImplement;
import thesis.mvc.model.Admin;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.model.Login;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;
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
		
		Boolean IDcheck = false;
		Boolean RegisterUnique = Boolean.parseBoolean(request.getParameter( "SpecialKey" ));
		int ConfirmID = Integer.parseInt( request.getParameter("UserID") );
		
		String forward = "";
		
		if (RegisterUnique) {
			LoginImplement loginImplement = new LoginImplement();
			if (loginImplement.getLoginByID(ConfirmID).getLoginStatus().equalsIgnoreCase("Just Registered")) {
				loginImplement.ConfirmLogin(ConfirmID);				
			}

			forward = "/Login.jsp";
		} else if (IDcheck){
			forward = "";//page to the admin's registration
		} else {
			forward = "";//page to the customer's registration
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean test = false;
		conn = DBUtility.getConnection();
		String forward;
		
		
		if (request.getParameter( "Password" ) != request.getParameter( "Password-repeat" ))
		{
			forward = "/index.jsp";
		}
		
		Login login = new Login();
		login.setUsername( request.getParameter( "Username" ) );
		login.setPassword( request.getParameter( "Password" ) );
		String secretCode = request.getParameter( "SecretCode" );
		
		//Image Saving Start
		
		
		
		
		
		
		if (secretCode == "i3Up8XmH04Jz151") {//Admin
			Admin admin = new Admin();
			admin.setUserID( Integer.parseInt( request.getParameter( "UserID" ) ) );
			admin.setFirstName( request.getParameter( "FirstName" ) );
			admin.setSurname( request.getParameter( "SurName" ) );
			test = Registration.makeAdmin(login, admin);
			
		} else if (secretCode == "5WLjE4Hik2TC85l") {//Dispatcher
			Dispatcher dispatcher = new Dispatcher();
			dispatcher.setCourierServiceID( Integer.parseInt( request.getParameter( "CourierServiceID" ) ) );
			dispatcher.setUserID( Integer.parseInt( request.getParameter( "UserID" ) ) );
			dispatcher.setFirstName( request.getParameter( "FirstName" ) );
			dispatcher.setLastName( request.getParameter( "LastName" ) );
			dispatcher.setContactNumber( Integer.parseInt( request.getParameter( "ContactNumber" ) ) );
			dispatcher.setAddress( request.getParameter( "Address" ) );
			dispatcher.setBirthdate( Date.valueOf( request.getParameter( "Birthdate" ) ) );
			test = Registration.makeDispatcher(login, dispatcher);
			
		} else if (secretCode == "RjRILW7K7Xz96hD") {//Pharmacist
			Pharmacist pharmacist = new Pharmacist();
			pharmacist.setBranchID( Integer.parseInt( request.getParameter( "BranchID" ) ) );
			pharmacist.setFirstName( request.getParameter( "FirstName" ) );
			pharmacist.setLastName( request.getParameter( "LastName" ) );
			pharmacist.setPRCNo( Integer.parseInt( request.getParameter( "PRCNo" ) ) );
			pharmacist.setPosition( request.getParameter( "Position" ) );
			test = Registration.makePharmacist(login, pharmacist);
			
		} else {
			Customer customer = new Customer();
			customer.setCustomerName( request.getParameter( "FullName" ) );
			customer.setAddress( request.getParameter( "CAddress" ) );
			customer.setEmail( request.getParameter( "CusEmail" ) );
			customer.setContactNumber( Integer.parseInt(request.getParameter( "ContactNumber" )) );
			customer.setIsSeniorCitizen(false);
			SendEmail sendEmail = new SendEmail();
			
			//Save Image Start
			boolean Seniorcheck = false;
			if (request.getParameter( "seniorbool" ) != null) {
				Seniorcheck = true;
			} if (Seniorcheck) {
				//Initial Info
				RegistrationAction registrationAction = new RegistrationAction();
				String SeniorSalt = registrationAction.getSaltString();
				customer.setSeniorCitizenID( SeniorSalt );
				customer.setIsSeniorCitizen(true);
				
				//Input into Folder
				String applicationPath = request.getServletContext().getRealPath("/") + "images";
				// constructs path of the directory to save uploaded file			
				// creates upload folder if it does not exists
				File uploadFolder = new File(applicationPath);
				if (!uploadFolder.exists()) {
					uploadFolder.mkdirs();
				}
				
				//Writing the file
				PrintWriter writer = response.getWriter();
				// write all files in upload folder
				for (Part part : request.getParts()) {
					if (part != null && part.getSize() > 0) {
						String fileName = SeniorSalt + ".jpg";
						String contentType = part.getContentType();
						
						// allows only JPEG files to be uploaded
						if(contentType != null) {
						if (!contentType.equalsIgnoreCase("image/jpeg")) {
							continue;
						}				
						part.write(uploadFolder + File.separator + fileName);
						}
					}
				}
			}

			int ID = Registration.makeCustomer(login, customer);
			
			//Save Image End
			
			
			String ConfirmLink = "http://localhost:8080/THESIS-ISPROJ2-PROJECT/RegistrationController?SpecialKey=true&UserID=" + ID;
			sendEmail.send(customer.getEmail(), "Medilivery Account Confirmation", ""
					+ "Dear " + customer.getCustomerName() + "," +  
					"<p>" + 
					"Thank you for creating your Medelivery Account." + 
					"<br>" + 
					"</p>" + 
					"<p>" + 
					"To complete your registration, click the link below:" + 
					"<br>" + 
					"<a href=\"" +
					ConfirmLink +
					"\" target=\"_blank\" data-saferedirecturl=\"\"><span class=\"il\">Confirm</span> your account</a>" + 
					"</p>" + 
					"<p>" + 
					"Yours truly," + 
					"<br>" + 
					"Medelivery Admin Team" + 
					"<br>" + 
					"<a href=\" <!–– INSERT Medelivery HOME LINK HERE––>\" target=\"_blank\" data-saferedirecturl=\"\"></a>" + 
					"<br>" + 
					"The Medelivery Team Thanks you for your patronage" + 
					"<br>" + customer.getSeniorCitizenID());
		}
		if(test){
			
			forward =  "/RegistrationSuccess.jsp";
		} else {
			forward = "/AccountRecovery.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
}
