package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.pageaction.ReportAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/ReportController")
public class ReportController {
	
	private Connection conn;
	
	public ReportController() {
		conn = DBUtility.getConnection();
	}

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String forward;
		int ReportTy = Integer.parseInt( request.getParameter( "ReportTy" ) );
		int UserType = (int) session.getAttribute("userAccess");
		forward = "/Catalog.jsp";
		
		ReportAction reportAction = new ReportAction();
		if (ReportTy == 1 && UserType == 1) {
			CustomerImplement customerImplement = new CustomerImplement();
	    	int customerID = customerImplement.getCustomerByUserId((int) session.getAttribute("userID")).getCustomerID();
			request.setAttribute("ReportGenerator", reportAction.ReportCustomerSales(customerID) );//CustomerID
		} else if (ReportTy == 2 && UserType == 2) {
			PharmacistImplement pharmacistImplement = new PharmacistImplement();
			int BranchID = pharmacistImplement.getPharmacistByUserId((int) session.getAttribute("userID")).getBranchID();
			request.setAttribute("ReportGenerator", reportAction.ReportPharmacySales(BranchID) );//PharmacyID
		} else if (ReportTy == 3 && UserType == 2) {
			
			request.setAttribute("ReportGenerator", reportAction.ReportProductSales(1) );//ProductID
		} else if (ReportTy == 4 && UserType == 2) {
			request.setAttribute("ReportGenerator", reportAction.ReportTotalSales());
		} else {
			forward = "extra.jsp";
		}
		/*
		SearchAction searchAction = new SearchAction();	
		session.setAttribute("ProductListing", searchAction.GeneralListing(BranchID) );
		*/
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		
	}
	

	//FilterAction filteraction = new FilterAction();
	//request.setAttribute( "SearchList", filteraction.ProductListing(1) );
	//session.setAttribute("orderPharmacistCheck", approvalAction.getOrder() );
	/*
	 * SendEmail sendEmail = new SendEmail();
				CustomerImplement customerImplement = new CustomerImplement();
				String message = "";
				
				sendEmail.send(customerImplement.getCustomerByUserId((int) session.getAttribute("userID")).getEmail(), "Customer Order List", message);
				response.sendRedirect(request.getContextPath() + "/index.jsp");
	 * 
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
