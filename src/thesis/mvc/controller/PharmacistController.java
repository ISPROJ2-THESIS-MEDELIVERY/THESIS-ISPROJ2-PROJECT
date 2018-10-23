package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.utility.DBUtility;

@WebServlet("/PharmacistController")
public class PharmacistController extends HttpServlet{
	
	private Connection conn;
	private static final String UPLOAD_DIR = "images";
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public PharmacistController() {
		conn = DBUtility.getConnection();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter( "Action" );
    	Pharmacist pharmacist = new PharmacistImplement().getPharmacistById((int) session.getAttribute("Pharmacist")); 
    	int pharmaID = new BranchImplement().getBranchById(pharmacist.getBranchID()).getPharmacyID();
    	
    	//get Pharma Orders
		List<Order> PharmacyOrders = new ArrayList<Order>();
		PharmacyOrders = new OrderImplement().getOrderByPharmacyId(pharmaID);
		session.setAttribute("PharmacyOrders", PharmacyOrders);
		List<OrderDetail> test = new OrderDetailImplement().getOrderDetail();
		request.setAttribute("PharmacyOrdersDetails", test );
		session.setAttribute( "PharmacyOrderDetailsList" , new OrderDetailImplement().getOrderDetail()  );
		
	    if (action.equalsIgnoreCase("GoToOrders")) {
			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
		} else if (action.equalsIgnoreCase("RejectOrder")){
			Order order = new OrderImplement().getOrderById( Integer.parseInt(request.getParameter("orderID")));
			order.setOrderStatus("CANCELLED");
			new OrderImplement().updateOrder( order );
			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
		} else if (action.equalsIgnoreCase("ApproveOrder")){
			Order order = new OrderImplement().getOrderById( Integer.parseInt(request.getParameter("orderID")));
			order.setOrderStatus("EN-ROUTE");
			new OrderImplement().updateOrder( order );
			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
