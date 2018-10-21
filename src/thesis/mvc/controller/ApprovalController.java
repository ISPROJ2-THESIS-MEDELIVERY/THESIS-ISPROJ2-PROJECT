package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.utility.DBUtility;

public class ApprovalController {

	
	private Connection conn;

	public ApprovalController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
		String action = "";
		String forward;
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) { action = request.getParameter( "action" ); }
		
		int PharmaID = 0;
		if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()){ session.setAttribute("SelectedBranch", request.getParameter( "UserBranch" ) ); }
		
	    if (PharmaID != 0) {
	    	ApprovalAction approvalAction = new ApprovalAction();
	    
		    if (action.equals(null)) {
			   	session.setAttribute("orderPharmacistCheck", approvalAction.getRegularOrder(PharmaID) );
			} else if (action.equalsIgnoreCase("Approve")) {
		    	approvalAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ), true );
		    } else if (action.equalsIgnoreCase("Reject")) {
			   	approvalAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ) , false );
		    } 
		   	RequestDispatcher view = request.getRequestDispatcher( "PharmacistPage.jsp" );
		   	view.forward(request, response);
		}
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
