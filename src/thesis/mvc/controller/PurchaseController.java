package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.model.Login;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
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
		
		Order order = new Order();
		order.setCustomerID();
		order.setOrderAddress( request.getParameter( "OrderAddress" ) );
		order.setDateOrdered( request.getParameter( " DateOrdered " ) );
		order.setDateProcessed( request.getParameter( "DateProcessed" ));
		order.setDateDelivered( request.getParameter( "DateDelivered" ));
		order.setOrderType( request.getParameter( "OrderType" ));
		order.setOrderStatus( request.getParameter( "OrderStatus" ));
		order.setSeniorDiscount( request.getParameter( "SeniorDiscount" ));
		order.setPaymentMethod( request.getParameter( "PaymentMethod" ));
		
		
		OrderDetail orderDetail1 = new OrderDetail();
		orderDetail1.setOrderID( request.getParameter( "OrderID1" ));
		orderDetail1.setProductID( request.getParameter( "ProductID1" ));
		orderDetail1.setQuantity( request.getIntHeader( "Quantity1" ));
		orderDetail1.setCostPerUnit( request.getIntHeader( "CostPerUnit1" ));
		orderDetail1.setTotalCost( request.getIntHeader( "TotalCost1" ));
		orderDetail1.setActualCost( request.getIntHeader( "ActualCost1" ));
		
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setOrderID( request.getParameter( "OrderID2" ));
		orderDetail2.setProductID( request.getParameter( "ProductID2" ));
		orderDetail2.setQuantity( request.getIntHeader( "Quantity2" ));
		orderDetail2.setCostPerUnit( request.getIntHeader( "CostPerUnit2" ));
		orderDetail2.setTotalCost( request.getIntHeader( "TotalCost2" ));
		orderDetail2.setActualCost( request.getIntHeader( "ActualCost2" ));
		
		OrderDetail orderDetail3 = new OrderDetail();
		orderDetail3.setOrderID( request.getParameter( "OrderID3" ));
		orderDetail3.setProductID( request.getParameter( "ProductID3" ));
		orderDetail3.setQuantity( request.getIntHeader( "Quantity3" ));
		orderDetail3.setCostPerUnit( request.getIntHeader( "CostPerUnit3" ));
		orderDetail3.setTotalCost( request.getIntHeader( "TotalCost3" ));
		orderDetail3.setActualCost( request.getIntHeader( "ActualCost3" ));
		
		OrderDetail orderDetail4 = new OrderDetail();
		orderDetail4.setOrderID( request.getParameter( "OrderID4" ));
		orderDetail4.setProductID( request.getParameter( "ProductID4" ));
		orderDetail4.setQuantity( request.getIntHeader( "Quantity4" ));
		orderDetail4.setCostPerUnit( request.getIntHeader( "CostPerUnit4" ));
		orderDetail4.setTotalCost( request.getIntHeader( "TotalCost4" ));
		orderDetail4.setActualCost( request.getIntHeader( "ActualCost4" ));
		
		OrderDetail orderDetail5 = new OrderDetail();
		orderDetail5.setOrderID( request.getParameter( "OrderID5" ));
		orderDetail5.setProductID( request.getParameter( "ProductID5" ));
		orderDetail5.setQuantity( request.getIntHeader( "Quantity5" ));
		orderDetail5.setCostPerUnit( request.getIntHeader( "CostPerUnit5" ));
		orderDetail5.setTotalCost( request.getIntHeader( "TotalCost5" ));
		orderDetail5.setActualCost( request.getIntHeader( "ActualCost5" ));

		//Global variable of customer ID here.
		/*
		Customer customer = new Customer();
		customer.setCustomerName( request.getParameter( "CustomerName" ) );
		customer.setAddress( request.getParameter( "Address" ) );
		customer.setEmail( request.getParameter( "Email" ) );
		customer.setSeniorCitizenID( request.getParameter( "SeniorCitizenID" ) );
		customer.setContactNumber( Integer.parseInt(request.getParameter( "ContactNumber" )) );
		
		Boolean test = Registration.makeCustomer(login, customer);
		*/
		RequestDispatcher view;
		if(test){
			view = request.getRequestDispatcher( "/index.jsp" );
		} else {
			view = request.getRequestDispatcher( "/index.jsp" );
		}
		view.forward(request, response);
	}

}
