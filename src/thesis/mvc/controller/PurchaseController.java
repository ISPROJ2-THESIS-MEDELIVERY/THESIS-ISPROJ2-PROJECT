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
		
    	if (action.equalsIgnoreCase("Customer")) {
    		forward = "/A-test-shop.jsp";
    		ProductImplement productImplement = new ProductImplement();
    		request.setAttribute( "productList", productImplement.getAllProducts() );
    	} else if (action.equalsIgnoreCase("Pharmacist")) {
    		forward = "A-test-pharmacistapproval.jsp";
    		ApprovalAction approvalAction = new ApprovalAction();
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
    	conn = DBUtility.getConnection();
		Boolean test = false;
		RequestDispatcher view = null;
		String action = request.getParameter( "Action" );
		HttpSession session = request.getSession();
		
		if(action == "Checkout") {
			PurchaseAction purchaseAction = new PurchaseAction();
			//Ensure that the checkout items are placed here
			Order order = new Order();
			order.setCustomerID( 4 );
			//order.setCustomerID( (Hint) session.getAttribute("userID") );
			order.setOrderAddress( request.getParameter( "orderAddress" ) );
			order.setSeniorDiscount( false );
			order.setPaymentMethod( request.getParameter( "orderPayment" ) );
			
			//Saving this for later.
			session.setAttribute("order", order );
			
			//Order Listing
			OrderDetail orderDetail1 = new OrderDetail();
			int ProductID1 = Integer.parseInt( request.getParameter( "ProductID1" ) );
			orderDetail1.setProductID( ProductID1 );
			int Quantity1 = Integer.parseInt( request.getParameter( "Quantity1" ) );
			orderDetail1.setQuantity( Quantity1 );
			Double CostPerUnit1 = purchaseAction.getProductCost( ProductID1, order );
			orderDetail1.setCostPerUnit( CostPerUnit1 );
			orderDetail1.setTotalCost( CostPerUnit1 * Quantity1 );
			
			OrderDetail orderDetail2 = new OrderDetail();
			int ProductID2 = Integer.parseInt( request.getParameter( "ProductID2" ) );
			orderDetail2.setProductID( ProductID2 );
			int Quantity2 = Integer.parseInt( request.getParameter( "Quantity2" ) );
			orderDetail2.setQuantity( Quantity2 );
			Double CostPerUnit2 = purchaseAction.getProductCost( ProductID2, order );
			orderDetail2.setCostPerUnit( CostPerUnit2 );
			orderDetail2.setTotalCost( CostPerUnit2 * Quantity2 );
			
			OrderDetail orderDetail3 = new OrderDetail();
			int ProductID3 = Integer.parseInt( request.getParameter( "ProductID3" ) );
			orderDetail3.setProductID( ProductID3 );
			int Quantity3 = Integer.parseInt( request.getParameter( "Quantity3" ) );
			orderDetail3.setQuantity( Quantity3 );
			Double CostPerUnit3 = purchaseAction.getProductCost( ProductID3, order );
			orderDetail3.setCostPerUnit( CostPerUnit3 );
			orderDetail3.setTotalCost( CostPerUnit3 * Quantity3 );
			
			OrderDetail orderDetail4 = new OrderDetail();
			int ProductID4 = Integer.parseInt( request.getParameter( "ProductID4" ) );
			orderDetail4.setProductID( ProductID4 );
			int Quantity4 = Integer.parseInt( request.getParameter( "Quantity4" ) );
			orderDetail4.setQuantity( Quantity4 );
			Double CostPerUnit4 = purchaseAction.getProductCost( ProductID4, order );
			orderDetail4.setCostPerUnit( CostPerUnit4 );
			orderDetail4.setTotalCost( CostPerUnit4 * Quantity4 );
			
			OrderDetail orderDetail5 = new OrderDetail();
			int ProductID5 = Integer.parseInt( request.getParameter( "ProductID5" ) );
			orderDetail5.setProductID( ProductID5 );
			int Quantity5 = Integer.parseInt( request.getParameter( "Quantity5" ) );
			orderDetail5.setQuantity( Quantity5 );
			Double CostPerUnit5 = purchaseAction.getProductCost( ProductID5, order );
			orderDetail5.setCostPerUnit( CostPerUnit5 );
			orderDetail5.setTotalCost( CostPerUnit5 * Quantity5 );
			
			Double ActualCost = orderDetail1.getTotalCost() + orderDetail2.getTotalCost() + orderDetail3.getTotalCost() + orderDetail4.getTotalCost() + orderDetail5.getTotalCost();
			//Delivery calculations will be done at a later time.
			orderDetail1.setActualCost(ActualCost);
			orderDetail2.setActualCost(ActualCost);
			orderDetail3.setActualCost(ActualCost);
			orderDetail4.setActualCost(ActualCost);
			orderDetail5.setActualCost(ActualCost);
			
			session.setAttribute("orderDetail1", orderDetail1 );
			session.setAttribute("orderDetail2", orderDetail2 );
			session.setAttribute("orderDetail3", orderDetail3 );
			session.setAttribute("orderDetail3", orderDetail3 );
			session.setAttribute("orderDetail5", orderDetail5 );
			
			//place the attributes on a reciept
			view = request.getRequestDispatcher( "/A-test-customerpurchasecheckout.jsp" );
			
			
		} else if (action == "Buy") {
			Order order = new Order();
			order = (Order) session.getAttribute("order");
			
			
			List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
			OrderDetails.add( (OrderDetail) session.getAttribute("orderDetail1") );
			OrderDetails.add( (OrderDetail) session.getAttribute("orderDetail2") );
			OrderDetails.add( (OrderDetail) session.getAttribute("orderDetail3") );
			OrderDetails.add( (OrderDetail) session.getAttribute("orderDetail3") );
			OrderDetails.add( (OrderDetail) session.getAttribute("orderDetail5") );

			PurchaseAction purchaseAction = new PurchaseAction();
			purchaseAction.purchaseOrder(order, OrderDetails);
			/*if(test){
				view = request.getRequestDispatcher( "/index.jsp" );
			} else {
				view = request.getRequestDispatcher( "/index.jsp" );
			}*/
			view = request.getRequestDispatcher( "/A-test-customerpurchasecheckout.jsp" );
		} else if (action == "Verify") {
			
		}
		view.forward(request, response);
	}

}
