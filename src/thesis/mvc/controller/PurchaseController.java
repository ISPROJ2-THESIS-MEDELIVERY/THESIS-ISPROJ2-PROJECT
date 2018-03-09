package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Login;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
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
		String forward = "/A-test-customerpurchase.jsp";
		ProductImplement productImplement = new ProductImplement();
		request.setAttribute( "productList", productImplement.getAllProducts() );
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	conn = DBUtility.getConnection();
		Login login = new Login();
		Boolean test = false;
		RequestDispatcher view = null;
		String action = request.getParameter( "Action" );
		HttpSession session = request.getSession();
		if(action == "Checkout") {
			//Ensure that the checkout items are placed here
			session.setAttribute("orderAddress", request.getParameter( "OrderAddress" ) );
			session.setAttribute("orderPayment", request.getParameter( "PaymentMethod" ) );
			//Order Listing
			session.setAttribute("orderDetail1ID", Integer.parseInt( request.getParameter( "ProductID1" ) ) );
			int quantity1 = Integer.parseInt( request.getParameter( "Quantity1" ) );
			session.setAttribute("orderDetail1QU", quantity1 );
			
			session.setAttribute("orderDetail2ID", Integer.parseInt( request.getParameter( "ProductID2" ) ) );
			int quantity2 = Integer.parseInt( request.getParameter( "Quantity2" ) );
			session.setAttribute("orderDetail2QU",  quantity2); 
			
			session.setAttribute("orderDetail3ID", Integer.parseInt( request.getParameter( "ProductID3" ) ) );
			int quantity3 = Integer.parseInt( request.getParameter( "Quantity3" ) );
			session.setAttribute("orderDetail3QU",  quantity3); 
			
			session.setAttribute("orderDetail4ID", Integer.parseInt( request.getParameter( "ProductID4" ) ) );
			int quantity4 = Integer.parseInt( request.getParameter( "Quantity4" ) );
			session.setAttribute("orderDetail4QU",  quantity4); 
			
			session.setAttribute("orderDetail5ID", Integer.parseInt( request.getParameter( "ProductID5" ) ) );
			int quantity5 = Integer.parseInt( request.getParameter( "Quantity5" ) );
			session.setAttribute("orderDetail5QU",  quantity5); 
			
			
			TotalCost
			//place the attributes on a reciept
			
			
		} else if (action == "Buy") {
			Order order = new Order();
			order.setCustomerID( 4 );
			//order.setCustomerID( (Hint) session.getAttribute("userID") );
			order.setOrderAddress( (String) request.getAttribute( "orderAddress" ) );
			order.setSeniorDiscount( false );
			//order.setSeniorDiscount( Boolean.parseBoolean( request.getParameter( "SeniorDiscount" ) ) );
			order.setPaymentMethod( (String) request.getParameter( "orderPayment" ) );
			
			PurchaseAction purchaseAction = new PurchaseAction();
			
			OrderDetail orderDetail1 = new OrderDetail();
			int ProductID1 = (int) session.getAttribute("orderDetail1ID");
			orderDetail1.setProductID( ProductID1 );
			int Quantity1 = (int) session.getAttribute("orderDetail1QU");
			orderDetail1.setQuantity( Quantity1 );
			Double CostPerUnit1 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID1);
			orderDetail1.setCostPerUnit( CostPerUnit1 );
			orderDetail1.setTotalCost( CostPerUnit1 * Quantity1 );
			
			OrderDetail orderDetail2 = new OrderDetail();
			int ProductID2 = (int) session.getAttribute("orderDetail2ID");
			orderDetail2.setProductID( ProductID2 );
			int Quantity2 = (int) session.getAttribute("orderDetail2QU");
			orderDetail2.setQuantity( Quantity2 );
			Double CostPerUnit2 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID2);
			orderDetail2.setCostPerUnit( CostPerUnit2 );
			orderDetail2.setTotalCost( CostPerUnit2 * Quantity2 );
			
			OrderDetail orderDetail3 = new OrderDetail();
			int ProductID3 = (int) session.getAttribute("orderDetail3ID");
			orderDetail3.setProductID( ProductID3 );
			int Quantity3 = (int) session.getAttribute("orderDetail3QU");
			orderDetail3.setQuantity( Quantity3 );
			Double CostPerUnit3 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID3);
			orderDetail3.setCostPerUnit( CostPerUnit3 );
			orderDetail3.setTotalCost( CostPerUnit3 * Quantity3 );
			
			OrderDetail orderDetail4 = new OrderDetail();
			int ProductID4 = (int) session.getAttribute("orderDetail4ID");
			orderDetail4.setProductID( ProductID4 );
			int Quantity4 = (int) session.getAttribute("orderDetail4QU");
			orderDetail4.setQuantity( Quantity4 );
			Double CostPerUnit4 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID4);
			orderDetail4.setCostPerUnit( CostPerUnit4 );
			orderDetail4.setTotalCost( CostPerUnit4 * Quantity4 );
			
			OrderDetail orderDetail5 = new OrderDetail();
			int ProductID5 = (int) session.getAttribute("orderDetail5ID");
			orderDetail5.setProductID( ProductID5 );
			int Quantity5 = (int) session.getAttribute("orderDetail5QU");
			orderDetail5.setQuantity( Quantity5 );
			Double CostPerUnit5 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID5);
			orderDetail5.setCostPerUnit( CostPerUnit5 );
			orderDetail5.setTotalCost( CostPerUnit5 * Quantity5 );
			
			List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
			OrderDetails.add(orderDetail1);
			OrderDetails.add(orderDetail2);
			OrderDetails.add(orderDetail3);
			OrderDetails.add(orderDetail4);
			OrderDetails.add(orderDetail5);
	
			purchaseAction.purchaseOrder(order, OrderDetails);
			
			if(test){
				view = request.getRequestDispatcher( "/index.jsp" );
			} else {
				view = request.getRequestDispatcher( "/index.jsp" );
			}
		} else if (action == "Verify") {
			
		}
		view.forward(request, response);
	}

}
