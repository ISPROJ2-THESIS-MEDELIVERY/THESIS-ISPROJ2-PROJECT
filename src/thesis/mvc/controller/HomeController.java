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

@WebServlet("/HomeController")
public class HomeController  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
<<<<<<< HEAD
		
		switch((int) session.getAttribute("userAccess")) {
		case 1:
			//Customer
			break;
		case 2:
			//Dispatcher
			break;
		case 3:
			//Pharmacist
			break;
		case 4:
			//Admin
			break;
		default:
			
			break;
=======
		int AL = 0;
		switch(AL) {
			case 1:
				PharmacistImplement pharmacistImplement = new PharmacistImplement();
				OrderImplement orderImplement = new OrderImplement();
				request.setAttribute( "PurchasePending", orderImplement.getPendingOrder((int) session.getAttribute("CustomerID"))) ;0
				//Remember to add a report button
				break;
			default:
				break;
>>>>>>> b30e2f9924fd684d24e72d8632721de8f9ddd75c
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
