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

import thesis.mvc.model.Login;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
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

		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		HttpSession session = request.getSession();
		Order order = new Order();
		order.setCustomerID( 4 );
		//order.setCustomerID( (int) session.getAttribute("userID") );
		order.setOrderAddress( request.getParameter( "OrderAddress" ) );
		order.setDateOrdered( CurrentDate );
		order.setSeniorDiscount( false );
		//order.setSeniorDiscount( Boolean.parseBoolean( request.getParameter( "SeniorDiscount" ) ) );
		order.setPaymentMethod( request.getParameter( "PaymentMethod" ) );
		
		OrderDetail orderDetail1 = new OrderDetail();
		orderDetail1.setOrderID( Integer.parseInt( request.getParameter( "OrderID1" ) ) );
		orderDetail1.setProductID( Integer.parseInt( request.getParameter( "ProductID1" ) ) );
		orderDetail1.setQuantity( request.getIntHeader( "Quantity1" ));
		orderDetail1.setCostPerUnit( request.getIntHeader( "CostPerUnit1" ));
		orderDetail1.setTotalCost( request.getIntHeader( "TotalCost1" ));
		orderDetail1.setActualCost( request.getIntHeader( "ActualCost1" ));
		
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setOrderID( Integer.parseInt( request.getParameter( "OrderID2" ) ) );
		orderDetail2.setProductID( Integer.parseInt( request.getParameter( "ProductID2" ) ) );
		orderDetail2.setQuantity( request.getIntHeader( "Quantity2" ));
		orderDetail2.setCostPerUnit( request.getIntHeader( "CostPerUnit2" ));
		orderDetail2.setTotalCost( request.getIntHeader( "TotalCost2" ));
		orderDetail2.setActualCost( request.getIntHeader( "ActualCost2" ));
		
		OrderDetail orderDetail3 = new OrderDetail();
		orderDetail3.setOrderID( Integer.parseInt( request.getParameter( "OrderID3" ) ) );
		orderDetail3.setProductID( Integer.parseInt( request.getParameter( "ProductID3" ) ) );
		orderDetail3.setQuantity( request.getIntHeader( "Quantity3" ));
		orderDetail3.setCostPerUnit( request.getIntHeader( "CostPerUnit3" ));
		orderDetail3.setTotalCost( request.getIntHeader( "TotalCost3" ));
		orderDetail3.setActualCost( request.getIntHeader( "ActualCost3" ));
		
		OrderDetail orderDetail4 = new OrderDetail();
		orderDetail4.setOrderID( Integer.parseInt( request.getParameter( "OrderID4" ) ) );
		orderDetail4.setProductID( Integer.parseInt( request.getParameter( "ProductID4" ) ) );
		orderDetail4.setQuantity( request.getIntHeader( "Quantity4" ));
		orderDetail4.setCostPerUnit( request.getIntHeader( "CostPerUnit4" ));
		orderDetail4.setTotalCost( request.getIntHeader( "TotalCost4" ));
		orderDetail4.setActualCost( request.getIntHeader( "ActualCost4" ));
		
		OrderDetail orderDetail5 = new OrderDetail();
		orderDetail5.setOrderID( Integer.parseInt( request.getParameter( "OrderID5" ) ) );
		orderDetail5.setProductID( Integer.parseInt( request.getParameter( "ProductID5" ) ) );
		orderDetail5.setQuantity( request.getIntHeader( "Quantity5" ));
		orderDetail5.setCostPerUnit( request.getIntHeader( "CostPerUnit5" ));
		orderDetail5.setTotalCost( request.getIntHeader( "TotalCost5" ));
		orderDetail5.setActualCost( request.getIntHeader( "ActualCost5" ));
		
		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
		OrderDetails.add(orderDetail1);
		OrderDetails.add(orderDetail2);
		OrderDetails.add(orderDetail3);
		OrderDetails.add(orderDetail4);
		OrderDetails.add(orderDetail5);

		PurchaseAction purchaseAction = new PurchaseAction();
		purchaseAction.purchaseOrder(order, OrderDetails);
		
		RequestDispatcher view;
		if(test){
			view = request.getRequestDispatcher( "/index.jsp" );
		} else {
			view = request.getRequestDispatcher( "/index.jsp" );
		}
		view.forward(request, response);
	}

}
