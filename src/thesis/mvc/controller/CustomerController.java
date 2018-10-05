package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Branch;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.pageaction.PurchaseAction.CartList;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.GeneralFunctions;
import thesis.mvc.utility.SendEmail;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet{
	
	private Connection conn;

	public CustomerController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Ensures that the person can select what he/she wants to buy
		String forward;
		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter( "action" );
		}

		if(action.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("GoToCatalog")) {
			int PharmaID = Integer.parseInt(request.getParameter( "PharmaID" ));
			session.setAttribute( "productList", new SearchAction().GeneralListing(PharmaID) );
			session.setAttribute( "SelectedPharmacy", new PharmacyImplement().getPharmacyById(PharmaID) );
			response.sendRedirect(request.getContextPath() + "/CatalogBasic.jsp");
		} else if (action.equalsIgnoreCase("GoToOrders")) {
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerOrders.jsp");
		}
		
    }

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
