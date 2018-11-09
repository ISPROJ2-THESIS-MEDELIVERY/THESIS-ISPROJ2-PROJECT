package thesis.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.PrescriptionImplement;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Driver;
import thesis.mvc.model.Order;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.model.Prescription;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.pageaction.ShopAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;
import thesis.mvc.utility.SendEmail;

@WebServlet("/CustomerController")
@MultipartConfig
public class CustomerController extends HttpServlet{
	
	private Connection conn;

	public CustomerController() {
		conn = DBUtility.getConnection();
	}
	//private final String UPLOAD_DIRECTORY = "../../../../../../../../THESIS-ISPROJ2-PROJECT/WebContent/images/";
	private final String UPLOAD_DIRECTORY = "/C:/ISPROJ2/Medelivery/webapp/images/";
	
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
			if (session.getAttribute("CatalogType") == null || session.getAttribute("CatalogType") == "Prescription" || (int) session.getAttribute("SelectedPharmacyID") != PharmaID) {
				session.setAttribute("CatalogType", "Regular");
				session.removeAttribute("SelectedPharmacy");
				session.removeAttribute("Order");
				session.removeAttribute("OrderDetails");
				session.removeAttribute("CartList");
			}
			session.setAttribute("CatalogType", "Regular");
			session.setAttribute("productList", new SearchAction().GeneralListing(PharmaID) );
			session.setAttribute("SelectedPharmacy", new PharmacyImplement().getPharmacyById(PharmaID) );
			session.setAttribute("SelectedPharmacyID", PharmaID);
			response.sendRedirect(request.getContextPath() + "/CatalogBasic.jsp");
		} else if(action.equalsIgnoreCase("GoToCatalogPrescription")) {
			int PharmaID = Integer.parseInt(request.getParameter( "PharmaID" ));
			if (session.getAttribute("CatalogType") == null || session.getAttribute("CatalogType") == "Regular" || (int) session.getAttribute("SelectedPharmacyID") != PharmaID) {
				session.setAttribute("CatalogType", "Prescription");
				session.removeAttribute("SelectedPharmacy");
				session.removeAttribute("Order");
				session.removeAttribute("OrderDetails");
				session.removeAttribute("CartList");
			}
			session.setAttribute("CatalogType", "Prescription");
			session.setAttribute("productList", new SearchAction().GeneralListing(PharmaID) );
			session.setAttribute("SelectedPharmacy", new PharmacyImplement().getPharmacyById(PharmaID) );
			session.setAttribute("SelectedPharmacyID", PharmaID);
			response.sendRedirect(request.getContextPath() + "/CatalogAdvanced.jsp");
		} else if (action.equalsIgnoreCase("GoToOrders")) {
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerOrders.jsp");
		} else if (action.equalsIgnoreCase("GoToPending")) {
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerPending.jsp");
		} else if (action.equalsIgnoreCase("GoToReturns")) {
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerReturn.jsp");
		} else if (action.equalsIgnoreCase("CancelOrder")) {
			Order cancelledOrder = new OrderImplement().getOrderById( Integer.parseInt(request.getParameter("OrderID")));
			if (new ShopAction().RefundOrder(cancelledOrder, "Customer Cancelled the order")) {
				cancelledOrder.setOrderStatus("CANCELLED");
				new OrderImplement().updateOrder( cancelledOrder );
				Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
				new SendEmail().send(new CustomerImplement().getCustomerById(cancelledOrder.getCustomerID()).getEmail(), "Transaction Cancelled on " + CurrentDate, new SendEmail().OrderEmail(cancelledOrder));
			}
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerPending.jsp");
		} else if (action.equalsIgnoreCase("ReturnOrder")) {
			System.out.println(action);
			System.out.println(request.getParameter("ReturnReason"));
			Order returnedOrder = new OrderImplement().getOrderById( Integer.parseInt(request.getParameter("OrderID")));
			returnedOrder.setOrderStatus("RETURN");
			Delivery Reason = new DeliveryImplement().getDeliverybyID(returnedOrder.getDeliveryID());
			Reason.setComments(request.getParameter("ReturnReason"));
			System.out.println(Reason.getDeliveryID());
			System.out.println(Reason.getComments());
			new DeliveryImplement().updateDelivery(Reason);
			new OrderImplement().updateOrder( returnedOrder );
			session.setAttribute("OrderHistory", new OrderImplement().getOrderByCustomerId((int)session.getAttribute("Customer")));
			session.setAttribute("OrderDetailHistory", new OrderDetailImplement().getOrderDetail() );
			response.sendRedirect(request.getContextPath() + "/CustomerReturn.jsp");
		}
		
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter( "action" );
		}
		
		if (action.equalsIgnoreCase("AddSeniorCitizenID")) {
			String SSIDName = "";
			Customer customer = new CustomerImplement().getCustomerById((int)session.getAttribute("Customer"));			
			 try {

	            	Part filePart = request.getPart("file");
					String name = "SSID" + customer.getCustomerID();
					String end = filePart.getContentType();
					if (end.startsWith("image")) {
						String imageType = end.replace("image/", "");
						name = name + "." + imageType;
						String DbaseName = new EncryptionFunction().encrypt(name);
						SSIDName = DbaseName;
						String AFileName = name;
						filePart.write(UPLOAD_DIRECTORY + File.separator + AFileName);
						System.out.println( "File Uploaded Successfully: " + UPLOAD_DIRECTORY + File.separator + AFileName);
					} else {
						System.out.println( "File Uploaded is not an image!");
					}
	            	
	            } catch (Exception ex) {
	            	System.out.println( "File Upload Failed due to " + ex);
	            }

			customer.setSeniorCitizenID(SSIDName);
			new CustomerImplement().updateCustomer(customer);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
}
