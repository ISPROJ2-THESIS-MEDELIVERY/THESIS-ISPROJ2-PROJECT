package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PrescriptionImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.Prescription;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.utility.DBUtility;

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
		String action = "";
		//String forward;
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) { action = request.getParameter( "action" ); }
		
		//int PharmaID = 0;
		//if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()){ session.setAttribute("SelectedBranch", request.getParameter( "UserBranch" ) ); }

		int orderID = Integer.parseInt(request.getParameter("orderID"));
	    ApprovalAction approvalAction = new ApprovalAction();
	    
		if (new OrderImplement().getOrderById(orderID).getOrderStatus().equalsIgnoreCase("CANCELLED")) {
			session.setAttribute( "Message" , "Order Has been Cancelled by the user" );
		} else if (action.equalsIgnoreCase("OrderReject")){
		   	approvalAction.pharmacistApproval( orderID, 1 );
		} else if (action.equalsIgnoreCase("OrderApprove")){
		   	approvalAction.pharmacistApproval( orderID, 2 );
			Order order = new OrderImplement().getOrderById(orderID);
		} else if (action.equalsIgnoreCase("OrderInvalidate")){
		   	approvalAction.pharmacistApproval( orderID , 3 );
			Order order = new OrderImplement().getOrderById(orderID);
			Prescription prescription = new PrescriptionImplement().getPrescriptionByID(order.getPrescriptionID());
			prescription.setPermissionStatus("REJECTED");
			prescription.setRemark(request.getParameter("Reason"));
			new PrescriptionImplement().updatePrescription(prescription);
			new OrderImplement().updateOrder( order );
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		//RequestDispatcher view = request.getRequestDispatcher( "PharmacistPage.jsp" );
		//view.forward(request, response);
	}
}
