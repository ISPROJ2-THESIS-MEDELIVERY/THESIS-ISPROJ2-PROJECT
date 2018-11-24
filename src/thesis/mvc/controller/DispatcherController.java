package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CourierServiceImplement;
import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.VehicleImplement;
import thesis.mvc.model.Audit;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Driver;
import thesis.mvc.model.Order;
import thesis.mvc.model.Vehicle;
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
			session.setAttribute( "Vehicles" , new VehicleImplement().getVehicles());
			session.setAttribute( "CourierService" , CourierID);
			response.sendRedirect(request.getContextPath() + "/DispatcherDirector.jsp");
		} else if(action.equalsIgnoreCase("addDriver")) {
			Driver driver = new Driver();
			driver.setDriverName((String) request.getParameter("driverName"));
			driver.setDriverAddress((String) request.getParameter("driverAddr"));
			driver.setDriverContactNumber((String) request.getParameter("driverCont"));
			driver.setCourierserviceID(CourierID);
			driver.setInTransit(false);
			new DriverImplement().addDriver(driver);
			session.setAttribute( "Message" , "Driver has been added" );
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("addVehicle")) {
			Vehicle vehicle = new Vehicle();
			vehicle.setPlateNumber((String) request.getParameter("PlateNumber"));
			vehicle.setCourierServiceID(CourierID);
			vehicle.setVehicleModel((String) request.getParameter("Vehicle"));
			new VehicleImplement().addVehicle(vehicle);
			session.setAttribute( "Message" , "Vehicle has been added" );
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("DeleteDriver")) {
			new DriverImplement().deleteDriver(Integer.valueOf(request.getParameter("DriverID")));
			session.setAttribute( "Message" , "Driver has been Deleted" );
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("DeleteVehicle")) {
			new VehicleImplement().deleteVehicle((String) request.getParameter("PlateNumber"));
			session.setAttribute( "Message" , "Vehicle has been Deleted" );
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("Message");
		
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter( "action" );
		}
		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
        Audit audit = new Audit();
        audit.setUserID((int) session.getAttribute("userID"));
        audit.setLogType("Login");
        audit.setTimestamp(CurrentDate);
		if(action.isEmpty()) {
			//response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else if(action.equalsIgnoreCase("assignOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			Order order = new OrderImplement().getOrderById(orderID);
			System.out.println(order.getOrderStatus().substring(order.getOrderStatus().length() - 1));
			int branchID = Integer.parseInt( request.getParameter("BranchID") );
			
			if(!order.getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				String count = order.getOrderStatus().substring(order.getOrderStatus().length() - 1);
				new OrderImplement().updateOrderStatus(orderID, "PROCESSED" + count, branchID);
				Delivery delivery = new Delivery();
				delivery.setComments(request.getParameter("Comments"));
				delivery.setDispatcherID((int) session.getAttribute("Dispatcher"));
				delivery.setDriverID(Integer.parseInt( request.getParameter("DriverID") ));
				delivery.setPlateNumber(request.getParameter("PlateNumber"));
				int DeliveryID = new DeliveryImplement().addDelivery(delivery);
				new OrderImplement().updateDeliveryID(orderID, DeliveryID);
				session.setAttribute( "Message" , "Order Has been dispatched" );
		        audit.setActionTaken("User Dispatched the order with the order ID:" +  orderID);
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
		        audit.setActionTaken("User was unable to dispatch order due to Cancellation of order ID:" +  orderID);
			}
			//Reload
		} else if(action.equalsIgnoreCase("confirmOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			if(!new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				Order order = new OrderImplement().getOrderById(orderID);
				order.setOrderStatus("COMPLETED");
				new OrderImplement().updateOrder(order);
				session.setAttribute( "Message" , "Order Has been confirmed" );
		        audit.setActionTaken("User confirmed the order with order ID:" + order.getOrderID());
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
		        audit.setActionTaken("User was unable to dispatch order due to Cancellation of order ID:" + orderID);
			}
		} else if(action.equalsIgnoreCase("returnedOrder")) {
			int orderID = Integer.parseInt( request.getParameter("OrderID") );
			if(!new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
				Order order = new OrderImplement().getOrderById(orderID);
				order.setOrderStatus("RETURNED");
				new OrderImplement().updateOrder(order);
				session.setAttribute( "Message" , "Order has been returned" );
		        audit.setActionTaken("User finished the returning of product the order with order ID:" + order.getOrderID());
			} else {
				session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
		        audit.setActionTaken("User was unable to dispatch order due to Cancellation of order ID:" + orderID);
			}
		}
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
		response.sendRedirect(request.getContextPath() + "/DispatcherController?Action=DispatchOrder");
	}
}
