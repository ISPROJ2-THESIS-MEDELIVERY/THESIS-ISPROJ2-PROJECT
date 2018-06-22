package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/ReportController")
public class ReportController {
	
	private Connection conn;
	
	public ReportController() {
		conn = DBUtility.getConnection();
	}

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward;
		String action = request.getParameter( "action" );
		HttpSession session = request.getSession();
		ApprovalAction approvalAction = new ApprovalAction();
		
    	if (action.equalsIgnoreCase("Customer")) {
    		forward = "/A-test-shop.jsp";
    		request.setAttribute( "productList", approvalAction.getProducts() );
    	} else if (action.equalsIgnoreCase("Pharmacist")) {
    		forward = "A-test-pharmacistapproval.jsp";
    		session.setAttribute("orderPharmacistCheck", approvalAction.getOrder() );
    	} else if (action.equalsIgnoreCase("Approve")) {
    		forward = "A-test-pharmacistapprovalsuccess.jsp";
    		PurchaseAction purchaseAction = new PurchaseAction();
    		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ), true );
    		
    	} else if (action.equalsIgnoreCase("Reject")) {
    		forward = "A-test-pharmacistapprovalsuccess.jsp";
    		PurchaseAction purchaseAction = new PurchaseAction();
    		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ) , false );
    		
    	} else {
    		forward = "";
    	}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
