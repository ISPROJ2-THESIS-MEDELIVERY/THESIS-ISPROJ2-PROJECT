package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.AdminImplement;
import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.PrescriptionImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.utility.EncryptionFunction;
import thesis.mvc.utility.GeneralFunctions;

@WebServlet("/HomeController")
public class HomeController  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int Switch;
		
		if (session.getAttribute("userAccess") != null) {
			Switch = (int) session.getAttribute("userAccess");
		} else {
			Switch = 0;
		}
		
		EncryptionFunction encryptionFunction = new EncryptionFunction();
		PharmacyImplement pharmacyImplement = new PharmacyImplement();
		
		//(replaced request to session)
		if (request.getAttribute("Featurepharm") == null) {
		session.setAttribute("Featurepharm", new PharmacyImplement().getAllPharmacys());
		session.setAttribute("Featurestock", new StocksImplement().getAllFeaturedStocks());
		session.setAttribute("Featureitems", new ProductImplement().getAllProducts());
		//System.out.println(request.getContextPath());
		}
		switch(Switch) {
		case 1:
			//Customer Information
			//CustomerImplement customerImplement = new CustomerImplement();
			//session.setAttribute("CustomerDetails", session.getAttribute("Customer") );
			//Listing pending orders
			//OrderImplement orderImplement = new OrderImplement();
			//session.setAttribute( "PurchasePending", (Customer) session.getAttribute("Customer"));
			//List all the pharmacies
			session.setAttribute("PharmcyList", pharmacyImplement.getAllPharmacys());
			//Remember to add a report button
			break;
		case 2:
			//DispatcherImplement dispatcherImplement = new DispatcherImplement();
			//session.setAttribute("DispatcherDetails", session.getAttribute("Dispatcher") );
			//Dispatcher
			break;
		case 3:
			int BranchxofPharmacist = new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") ).getBranchID();
			int PharmacyofBranch = new BranchImplement().getBranchById(BranchxofPharmacist).getPharmacyID();
			session.setAttribute("PharmacistBranch", new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") ));
			session.setAttribute("IncomingOrders", new OrderImplement().getOrderByPharmacyId(PharmacyofBranch));
			
			session.setAttribute( "IncomingOrderDetails" , new OrderDetailImplement().getOrderDetail()  );
			session.setAttribute( "ProductTranslation" , new ProductImplement().getAllProducts() );
			session.setAttribute( "PrescriptionImage" , new PrescriptionImplement().getAllPrescription());
			//PharmacistImplement pharmacistImplement = new PharmacistImplement();
			//session.setAttribute("PharmacistDetails", session.getAttribute("Pharmacist") );
			//PharmacyImplement pharmacyImplement1 = new PharmacyImplement();
			//session.setAttribute("PharmcyofPharmacist", pharmacyImplement1.getPharmacyById(1));
			//Pharmacist
			break;
		case 4:
			//AdminImplement adminImplement = new AdminImplement();
			//session.setAttribute("AdminDetails", adminImplement.getAdminById( (int) session.getAttribute("AdminID") ) );
			//Users
			session.setAttribute("CustomerList", new CustomerImplement().getAllCustomers());
			session.setAttribute("DispatcherList", new DispatcherImplement().getAllDispatchers());
			session.setAttribute("PharmacistList", new PharmacistImplement().getAllPharmacists());
			session.setAttribute("AdminList", new AdminImplement().getAllAdmins());
			//Items
			session.setAttribute("PharmcyList", pharmacyImplement.getAllPharmacys());
			session.setAttribute("BranchList", new BranchImplement().getAllBranch());
			session.setAttribute("CourierList", new CourierServiceImplement().getAllCourierService());
			session.setAttribute("Prescription", new PrescriptionImplement().getAllPrescription());
		   	session.setAttribute("ProductList", new ProductImplement().getAllProducts() );
			break;
		default:
			break;
		}
		GeneralFunctions.checkAttributes(session);
		response.sendRedirect(request.getContextPath() + "/home.jsp");
		System.out.println(request.getContextPath());
		System.out.println(request.getRealPath(request.getContextPath()));
		//response.sendRedirect(request.getContextPath() + "/home.jsp");
		//RequestDispatcher view = request.getRequestDispatcher( "/home.jsp" );
		//view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view;
		view = request.getRequestDispatcher( "/invalidError.jsp" );
		//request.setAttribute("customers", dao.getAllCustomers());
		view.forward(request, response);
	}
}
