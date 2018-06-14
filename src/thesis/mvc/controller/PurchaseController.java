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

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.pageaction.PurchaseAction.CartList;
import thesis.mvc.pageaction.RegistrationAction;
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
    
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward;
		int ProductID = 2;
		int Quantity = 2;
		double CostPerUnit = 0.0;
    	conn = DBUtility.getConnection();
		String action = request.getParameter( "Action" );
		HttpSession session = request.getSession(true);
		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
		PurchaseAction purchaseAction = new PurchaseAction();
		
		if(action.equalsIgnoreCase("Addtocart")) {
			
			//sets order and generates it if it does not exist
			Order order = (Order) session.getAttribute("Order");
			if(order == null) {
				//order.setCustomerID( session.getAttribute("userID") );
				//order.setSeniorDiscount( session.getAttribute("seniorStatus") );
				order = purchaseAction.setInitalOrder(4, "test", false, "Cash");
				session.setAttribute("Order", order );
				
				//ProductID & Quantity & Cost per unit
				ProductID = Integer.valueOf( request.getParameter( "ProductID" ) );
				Quantity = Integer.valueOf( request.getParameter( "Quantity" ) );
				CostPerUnit = purchaseAction.getProductCost( ProductID, 1, order );
				
				//Takes the existing order detail if there is and adds the next order detail to there
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProductID(ProductID);
				orderDetail.setQuantity(Quantity);
				orderDetail.setCostPerUnit(CostPerUnit);
				orderDetail.setTotalCost( Math.round(CostPerUnit * Quantity * 100) / 100 );
				OrderDetails.add( orderDetail );
				session.setAttribute("OrderDetails", OrderDetails );

				
				//Insert things into cartDetails
				ProductImplement productImplement = new ProductImplement();
				Product product = new Product();
				product = productImplement.getProductById(orderDetail.getProductID());
				
				List<CartList> cartlists = new ArrayList<CartList>();
				CartList cartlist = purchaseAction.new CartList();
				cartlist.setName(product.getProductName());
				cartlist.setDescription(product.getProductDescription());
				cartlist.setImage(product.getProductImage());
				cartlist.setSize(product.getProductPackaging());
				cartlist.setPrescription(product.isRXProduct());
				cartlist.setQuantity(orderDetail.getQuantity());
				cartlist.setUnitCost(orderDetail.getCostPerUnit());
				cartlist.setTotalCost(orderDetail.getTotalCost());
				cartlists.add(cartlist);
				session.setAttribute("CartList", cartlists );
				
				/*
				//Something
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProductID(ProductID);
				orderDetail.setQuantity(Quantity);
				orderDetail.setCostPerUnit(CostPerUnit);
				orderDetail.setTotalCost( Math.round(CostPerUnit * Quantity * 100) / 100 );
				OrderDetails.add( orderDetail );
				session.setAttribute("CartDetails", OrderDetails );
				*/
				//Refreshes and goes back to the cart
				//forward = "/cart.jsp";
				forward = "/A-test-customerpurchasecheckout.jsp";
			} else {
				//ProductID & Quantity & Cost per unit
				ProductID = Integer.valueOf( request.getParameter( "ProductID" ) );
				Quantity = Integer.valueOf( request.getParameter( "Quantity" ) );
				CostPerUnit = purchaseAction.getProductCost( ProductID, 1, order );
				
				//Takes the existing order detail if there is and adds the next order detail to there
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProductID(ProductID);
				orderDetail.setQuantity(Quantity);
				orderDetail.setCostPerUnit(CostPerUnit);
				orderDetail.setTotalCost(CostPerUnit * Quantity);
				OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
				OrderDetails.add( orderDetail );
				session.setAttribute("OrderDetails", OrderDetails );
				
				//Refreshes and goes back to the cart
				//forward = "/cart.jsp";
				forward = "/A-test-customerpurchasecheckout.jsp";
			}
			
			
		} else if (action.equalsIgnoreCase("Checkout")) {
			Order order = (Order) session.getAttribute("order");
			//order.setOrderAddress( request.getParameter( "orderAddress" ) );
			//order.setPaymentMethod( request.getParameter( "orderPayment" ) );
			//order.setDateOrdered(today);
			OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
			
			if ( order != null || !OrderDetails.isEmpty()) {
				purchaseAction.purchaseOrder(order, OrderDetails);
				session.setAttribute("orderReciept", order);
				session.setAttribute("OrderDetailsReciept", OrderDetails);
				session.removeAttribute("order");
				session.removeAttribute("OrderDetails");
			}
			
			forward = "/A-test-customerpurchasecheckout.jsp";
		} else if (action.equalsIgnoreCase("Verify")) {

			forward = "/A-test-customerpurchasecheckout.jsp";
		} else {

			forward = "/A-test-customerpurchasecheckout.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}

}
