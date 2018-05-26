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

import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/PurchaseController")
public class PurchaseController extends HttpServlet {
	
	private Connection conn;

	public PurchaseController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Ensures that the person can select what he/she wants to buy
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
    
	@SuppressWarnings({ "unchecked", "null" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	conn = DBUtility.getConnection();
		Boolean test = false;
		RequestDispatcher view = null;
		String action = request.getParameter( "Action" );
		HttpSession session = request.getSession();
		Order order = new Order();
		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
		PurchaseAction purchaseAction = new PurchaseAction();
		
		if(action == "Addtocart") {
			
			//sets order and generates it if it does not exist
			order = (Order) session.getAttribute("order");
			if(order == null) {
				order.setCustomerID( 4 );
				//order.setCustomerID( session.getAttribute("userID") );
				order.setOrderAddress( request.getParameter( "orderAddress" ) );
				order.setSeniorDiscount( false );
				//order.setSeniorDiscount( session.getAttribute("seniorStatus") );
				order.setPaymentMethod( request.getParameter( "orderPayment" ) );
				session.setAttribute("order", order );
			}
			
			//Takes the existing order detail if there is and adds the next order detail to there
			OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
			
			//Ensure that the checkout items are placed here
			OrderDetail orderDetail = new OrderDetail();
			int ProductID = Integer.parseInt( request.getParameter( "ProductID" ) );
			orderDetail.setProductID( ProductID );
			int Quantity = Integer.parseInt( request.getParameter( "Quantity" ) );
			orderDetail.setQuantity( Quantity );
			Double CostPerUnit = purchaseAction.getProductCost( ProductID, order );
			orderDetail.setCostPerUnit( CostPerUnit );
			orderDetail.setTotalCost( CostPerUnit * Quantity );
			OrderDetails.add( orderDetail );
			session.setAttribute("OrderDetails", OrderDetails );
			
			//Refreshes and goes back to the cart
			view = request.getRequestDispatcher( "/A-test-cart.jsp" );
			
			
		} else if (action == "Checkout") {
			order = (Order) session.getAttribute("order");
			OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
			
			if ( order != null || !OrderDetails.isEmpty()) {
				purchaseAction.purchaseOrder(order, OrderDetails);
				session.setAttribute("orderReciept", order);
				session.setAttribute("order", null );
				session.setAttribute("OrderDetailsReciept", OrderDetails);
				session.setAttribute("OrderDetails", null );
				
			}
			
			view = request.getRequestDispatcher( "/A-test-customerpurchasecheckout.jsp" );
		} else if (action == "Verify") {
			
		}
		view.forward(request, response);
	}

}
