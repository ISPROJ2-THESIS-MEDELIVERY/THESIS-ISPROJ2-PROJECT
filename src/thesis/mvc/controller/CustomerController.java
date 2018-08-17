package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet{
	
	private Connection conn;

	public CustomerController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Ensures that the person can select what he/she wants to buy
		String forward;
		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			action = request.getParameter( "action" );			
		}
		
		int PharmaID = 0;
		if (session.getAttribute("PharmaID") != null) {
			PharmaID = (int) session.getAttribute("PharmaID");
			BranchImplement branchImplement = new BranchImplement();
			session.setAttribute("SelectedBranch", branchImplement.getBranchById(PharmaID));
		} else if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()){
			PharmaID = Integer.parseInt( request.getParameter( "PharmaID" ) );
			BranchImplement branchImplement = new BranchImplement();
			session.setAttribute("SelectedBranch", branchImplement.getBranchById(PharmaID));
		}
		
		int access = 0;
		if (session.getAttribute("userAccess") != null) {
			access = (int) session.getAttribute("userAccess");	
		}
		
		
		boolean test = true;
    	
		if (access == 1) {
			if (isInteger(action) && Integer.parseInt(action) > 0) {
				//Get the order
				OrderImplement orderImplement = new OrderImplement();
	    		Order order = orderImplement.getOrderById(Integer.parseInt(action));
	    		if (order.getOrderStatus().equalsIgnoreCase("APPROVED")) {
	    			session.setAttribute("ApproveChecker", true);
	    		} else {
	    			session.setAttribute("ApproveChecker", false);
	    		}
	    		//Get the Details
	    		OrderDetailImplement orderDetailImplement = new OrderDetailImplement();
	    		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
				OrderDetails = orderDetailImplement.getspecificOrderDetail(Integer.parseInt(action));
				
				//Ready the Cart List
				PurchaseAction purchaseAction = new PurchaseAction();
				List<CartList> cartlists = new ArrayList<CartList>();
				ProductImplement productImplement = new ProductImplement();
				for (OrderDetail orderDetail : OrderDetails) {
					CartList cartlist = purchaseAction.new CartList();
					//Product Info
					Product product = productImplement.getProductById(orderDetail.getProductID());
					cartlist.setName(product.getProductName());
					cartlist.setDescription(product.getProductDescription());
					cartlist.setImage(product.getProductImage());
					cartlist.setSize(product.getProductPackaging());
					cartlist.setPrescription(product.isRXProduct());
					
					//Other Details
					cartlist.setQuantity(orderDetail.getQuantity());
					cartlist.setUnitCost(orderDetail.getCostPerUnit());
					cartlist.setTotalCost(orderDetail.getTotalCost());
					cartlists.add(cartlist);
				}
				
				//Set The UserID
				session.setAttribute("orderReciept", order);
				session.setAttribute("CartlistReciept", cartlists);
				forward = "/Checkout.jsp";
	    		RequestDispatcher view = request.getRequestDispatcher( forward );
	    		view.forward(request, response);
			} else {
	    		SearchAction searchAction = new SearchAction();
	    		forward = "/Catalog.jsp";
	    		request.setAttribute( "productList", searchAction.GeneralListing(PharmaID) );
	    		RequestDispatcher view = request.getRequestDispatcher( forward );
	    		view.forward(request, response);
			}
    		
    	} else if (access == 3) {
    		if (action.equalsIgnoreCase("Approve")) {
        		PurchaseAction purchaseAction = new PurchaseAction();
        		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ), true );
        	} else if (action.equalsIgnoreCase("Reject")) {
        		PurchaseAction purchaseAction = new PurchaseAction();
        		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ) , false );
        	} if (PharmaID != 0) {
	    		ApprovalAction approvalAction = new ApprovalAction();
	    		session.setAttribute("orderPharmacistCheck", approvalAction.getRegularOrder(PharmaID) );
	    		forward = "PharmacistPage.jsp";
	    		RequestDispatcher view = request.getRequestDispatcher( forward );
	    		view.forward(request, response);
        	} else {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
    	} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
    	}
    }

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}