package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.model.Order;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;

@WebServlet("/DispatcherController")
public class DispatcherController extends HttpServlet {

	private Connection conn;

	public DispatcherController() {
		conn = DBUtility.getConnection();
	}
	
	private RegistrationAction Registration = new RegistrationAction();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Ensures that the person can select what he/she wants to buy
		String forward;
		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("Action") != null) {
			action = request.getParameter( "Action" );
		}

		if(action.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("DispatchOrder")) {
			session.setAttribute( "DispatcherOrderList" , new OrderImplement().getOrder() );
			session.setAttribute( "SelectPharmacy", new PharmacyImplement().getAllPharmacys() );
			session.setAttribute( "ListBranches" , new BranchImplement().getAllBranch() );
			session.setAttribute( "DispatcherOrderDetailsList" , new OrderDetailImplement().getOrderDetail()  );
			response.sendRedirect(request.getContextPath() + "/DispatcherDirector.jsp");
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter( "action" );
		}

		if(action.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("assignOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			int branchID = Integer.parseInt( request.getParameter("BranchID") );
			new OrderImplement().updateOrderStatus(orderID, "PROCESSED", branchID);
			session.setAttribute( "DispatcherOrderList" , new OrderImplement().getOrder() );
			session.setAttribute( "SelectPharmacy", new PharmacyImplement().getAllPharmacys() );
			session.setAttribute( "ListBranches" , new BranchImplement().getAllBranch() );
			session.setAttribute( "DispatcherOrderDetailsList" , new OrderDetailImplement().getOrderDetail()  );
			response.sendRedirect(request.getContextPath() + "/DispatcherDirector.jsp");
		}
		
	}
}
