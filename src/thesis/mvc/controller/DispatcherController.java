package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Driver;
import thesis.mvc.model.Order;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.utility.DBUtility;

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
		if (request.getParameter("Action") != null) { action = request.getParameter( "Action" ); }
		
		int DispatcherID = (int) session.getAttribute("Dispatcher");
		int CourierID = new CourierServiceImplement().getCourierServiceById(new DispatcherImplement().getDispatcherById(DispatcherID).getCourierServiceID()).getCourierServiceID();
		
		if(action.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("DispatchOrder")) {
			session.setAttribute( "DispatcherOrderList" , new OrderImplement().getOrder() );
			session.setAttribute( "SelectPharmacy", new PharmacyImplement().getAllPharmacys() );
			session.setAttribute( "ListBranches" , new BranchImplement().getAllBranch() );
			session.setAttribute( "DispatcherOrderDetailsList" , new OrderDetailImplement().getOrderDetail()  );
			session.setAttribute( "DriverList" , new DriverImplement().getAllDrivers());
			session.setAttribute( "ProductTranslation" , new ProductImplement().getAllProducts());
			session.setAttribute( "CourierService" , CourierID);
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
			//response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("assignOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			int branchID = Integer.parseInt( request.getParameter("BranchID") );
			
			if(!new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				new OrderImplement().updateOrderStatus(orderID, "PROCESSED", branchID);
				Delivery delivery = new Delivery();
				delivery.setComments(request.getParameter("Comments"));
				delivery.setDispatcherID((int) session.getAttribute("Dispatcher"));
				delivery.setDriverID(Integer.parseInt( request.getParameter("DriverID") ));
				delivery.setPlateNumber(request.getParameter("PlateNumber"));
				int DeliveryID = new DeliveryImplement().addDelivery(delivery);
				new OrderImplement().updateDeliveryID(orderID, DeliveryID);
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
			}
			//Reload
		} else if(action.equalsIgnoreCase("confirmOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			
			if(!new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				Order order = new OrderImplement().getOrderById(orderID);
				order.setOrderStatus("COMPLETED");
				new OrderImplement().updateOrder(order);
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
			}
		} else if(action.equalsIgnoreCase("returnedOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			if(!new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				Order order = new OrderImplement().getOrderById(orderID);
				order.setOrderStatus("RETURNED");
				new OrderImplement().updateOrder(order);
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
			}
		} else if (action.equalsIgnoreCase("newDriver")) {
			Driver newDriver = new Driver();
			newDriver.setCourierserviceID(1);
		}
		response.sendRedirect(request.getContextPath() + "/DispatcherController?Action=DispatchOrder");
	}
}
