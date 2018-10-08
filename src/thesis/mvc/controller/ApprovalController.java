package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.utility.DBUtility;

public class ApprovalController {

	
	private Connection conn;

	public ApprovalController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String forward;
		HttpSession session = request.getSession();
		
		String action = request.getParameter( "action" );
		
		int PharmaID = 0;
		if (session.getAttribute("PharmaID") != null) {
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
    	
		ApprovalAction approvalAction = new ApprovalAction();
    	if (action.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
    	} else if (action.equalsIgnoreCase("Approve")) {
    		approvalAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ), true );
    	} else if (action.equalsIgnoreCase("Reject")) {
    		approvalAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ) , false );
    	}	
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
