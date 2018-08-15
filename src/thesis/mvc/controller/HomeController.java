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
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.model.Customer;

@WebServlet("/HomeController")
public class HomeController  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		switch((int) session.getAttribute("userAccess")) {
		case 1:
			//Customer Information
			CustomerImplement customerImplement = new CustomerImplement();
			request.setAttribute("CustomerDetails", session.getAttribute("Customer") );
			//
			OrderImplement orderImplement = new OrderImplement();
			Customer customer = (Customer) session.getAttribute("Customer");
			request.setAttribute( "PurchasePending", customer);
			//
			PharmacyImplement pharmacyImplement = new PharmacyImplement();
			request.setAttribute("PharmcyList", pharmacyImplement.getAllPharmacys());
			//Remember to add a report button
			break;
		case 2:
			DispatcherImplement dispatcherImplement = new DispatcherImplement();
			request.setAttribute("DispatcherDetails", session.getAttribute("Dispatcher") );
			//Dispatcher
			break;
		case 3:
			PharmacistImplement pharmacistImplement = new PharmacistImplement();
			request.setAttribute("PharmacistDetails", session.getAttribute("Pharmacist") );
			PharmacyImplement pharmacyImplement1 = new PharmacyImplement();
			request.setAttribute("PharmcyofPharmacist", pharmacyImplement1.getPharmacyById(1));
			//Pharmacist
			break;
		case 4:
			AdminImplement adminImplement = new AdminImplement();
			request.setAttribute("AdminDetails", adminImplement.getAdminById( (int) session.getAttribute("AdminID") ) );
			//Admin
			break;
		default:
			break;
		}
		RequestDispatcher view = request.getRequestDispatcher( "/Home.jsp" );
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view;
		view = request.getRequestDispatcher( "/invalidError.jsp" );
		//request.setAttribute("customers", dao.getAllCustomers());
		view.forward(request, response);
	}
}
