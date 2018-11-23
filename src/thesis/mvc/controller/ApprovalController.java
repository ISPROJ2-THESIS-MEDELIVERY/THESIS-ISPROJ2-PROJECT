package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PrescriptionImplement;
import thesis.mvc.model.Audit;
import thesis.mvc.model.Order;
import thesis.mvc.model.Prescription;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.ShopAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.SendEmail;

@WebServlet("/ApprovalController")
public class ApprovalController extends HttpServlet{

	
	private Connection conn;

	public ApprovalController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
		session.removeAttribute("Message");
		String action = "";
		//String forward;
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) { action = request.getParameter( "action" ); }
		
		//int PharmaID = 0;
		//if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()){ session.setAttribute("SelectedBranch", request.getParameter( "UserBranch" ) ); }

		int orderID = Integer.parseInt(request.getParameter("orderID"));
		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm a");
	    ApprovalAction approvalAction = new ApprovalAction();
		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
        Audit audit = new Audit();
        audit.setUserID((int) session.getAttribute("Pharmacist"));
        audit.setLogType("Approval");
        audit.setTimestamp(CurrentDate);
	    
		if (new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
			session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
		} else if (action.equalsIgnoreCase("OrderReject")){
		   	approvalAction.pharmacistApproval( orderID, 1 );
	        audit.setActionTaken("order ID: " + orderID + " was rejected by user ID No:" + session.getAttribute("Pharmacist"));
		} else if (action.equalsIgnoreCase("OrderApprove")){
		   	approvalAction.pharmacistApproval( orderID, 2 );
			Order order = new OrderImplement().getOrderById(orderID);
			new SendEmail().send(new CustomerImplement().getCustomerById(order.getCustomerID()).getEmail(), "Transaction accepted on " + dateFormat.format(CurrentDate), new SendEmail().OrderEmail(order));
	        audit.setActionTaken("order ID: " + orderID + " was approved by user ID No:" + session.getAttribute("Pharmacist"));
		} else if (action.equalsIgnoreCase("OrderInvalidate")){
			Order order = new OrderImplement().getOrderById(orderID);
			if (new ShopAction().RefundOrder(order, "Pharmacist Invalidated the order")) {
		        audit.setActionTaken("order ID:" + orderID + " was invalidated and cancelled by user ID No:" + session.getAttribute("Pharmacist"));
			} else {
		        audit.setActionTaken("order ID:" + orderID + " was invalidated and cancelled by user ID No:" + session.getAttribute("Pharmacist") + " But Failed to refund due to error");
			}
		   	approvalAction.pharmacistApproval( orderID, 3 );
			Prescription prescription = new PrescriptionImplement().getPrescriptionByID(order.getPrescriptionID());
			prescription.setPermissionStatus("REJECTED");
			prescription.setRemark(request.getParameter("Reason"));
			new PrescriptionImplement().updatePrescription(prescription);
			new SendEmail().send(new CustomerImplement().getCustomerById(order.getCustomerID()).getEmail(), "Transaction rejected on " + dateFormat.format(CurrentDate), new SendEmail().OrderEmail(order));
		} else if (action.equalsIgnoreCase("ReturnReject")){
		   	approvalAction.pharmacistApproval( orderID, 4 );
	        audit.setActionTaken("order ID: " + orderID + " was approved for returns by user ID No:" + session.getAttribute("Pharmacist"));
		} else if (action.equalsIgnoreCase("ReturnApprove")){
		   	approvalAction.pharmacistApproval( orderID, 5 );
	        audit.setActionTaken("order ID: " + orderID + " was disapproved for returns by user ID No:" + session.getAttribute("Pharmacist"));
		}
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		//RequestDispatcher view = request.getRequestDispatcher( "PharmacistPage.jsp" );
		//view.forward(request, response);
	}
}
