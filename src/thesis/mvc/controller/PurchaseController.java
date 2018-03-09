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
		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	conn = DBUtility.getConnection();
		Login login = new Login();
		Boolean test = false;
		RequestDispatcher view;
		String action = request.getParameter( "Action" );
		
		if (action == "Buy") {
			HttpSession session = request.getSession();
			Order order = new Order();
			order.setCustomerID( 4 );
			//order.setCustomerID( (int) session.getAttribute("userID") );
			order.setOrderAddress( request.getParameter( "OrderAddress" ) );
			order.setSeniorDiscount( false );
			//order.setSeniorDiscount( Boolean.parseBoolean( request.getParameter( "SeniorDiscount" ) ) );
			order.setPaymentMethod( request.getParameter( "PaymentMethod" ) );
			
			PurchaseAction purchaseAction = new PurchaseAction();
			
			OrderDetail orderDetail1 = new OrderDetail();
			int ProductID1 =Integer.parseInt( request.getParameter( "ProductID1" ) );
			orderDetail1.setProductID( ProductID1 );
			int Quantity1 = Integer.parseInt( request.getParameter( "Quantity1" ) );
			orderDetail1.setQuantity( Quantity1 );
			Double CostPerUnit1 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID1);
			orderDetail1.setCostPerUnit( CostPerUnit1 );
			orderDetail1.setTotalCost( CostPerUnit1 * Quantity1 );
			
			OrderDetail orderDetail2 = new OrderDetail();
			int ProductID2 =Integer.parseInt( request.getParameter( "ProductID2" ) );
			orderDetail2.setProductID( ProductID2 );
			int Quantity2 = Integer.parseInt( request.getParameter( "Quantity2" ) );
			orderDetail2.setQuantity( Quantity2 );
			Double CostPerUnit2 = purchaseAction.getProductCost( order.getPharmacistID(), ProductID2);
			orderDetail2.setCostPerUnit( CostPerUnit2 );
			orderDetail2.setTotalCost( CostPerUnit2 * Quantity2 );
			
			OrderDetail orderDetail3 = new OrderDetail();
			orderDetail3.setProductID( Integer.parseInt( request.getParameter( "ProductID3" ) ) );
			orderDetail3.setQuantity( request.getIntHeader( "Quantity3" ));
			orderDetail3.setCostPerUnit( request.getIntHeader( "CostPerUnit3" ));
			orderDetail3.setTotalCost( request.getIntHeader( "TotalCost3" ));
			
			OrderDetail orderDetail4 = new OrderDetail();
			orderDetail4.setProductID( Integer.parseInt( request.getParameter( "ProductID4" ) ) );
			orderDetail4.setQuantity( request.getIntHeader( "Quantity4" ));
			orderDetail4.setCostPerUnit( request.getIntHeader( "CostPerUnit4" ));
			orderDetail4.setTotalCost( request.getIntHeader( "TotalCost4" ));
			
			OrderDetail orderDetail5 = new OrderDetail();
			orderDetail5.setProductID( Integer.parseInt( request.getParameter( "ProductID5" ) ) );
			orderDetail5.setQuantity( request.getIntHeader( "Quantity5" ));
			orderDetail5.setCostPerUnit( request.getIntHeader( "CostPerUnit5" ));
			orderDetail5.setTotalCost( request.getIntHeader( "TotalCost5" ));
			
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
