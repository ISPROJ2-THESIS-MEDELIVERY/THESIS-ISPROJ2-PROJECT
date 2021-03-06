package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Order;
import thesis.mvc.utility.DBUtility;

public class DispatcherAction {
	
	private Connection conn;

	public DispatcherAction() {
		conn = DBUtility.getConnection();
	}
	
	public List<Order> getpaidOrder() {
		List<Order> orders = new ArrayList<Order>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM `order` WHERE OrderStatus = 'PAID'" );
			while( resultSet.next() ) {
				Order order = new Order();
				order.setOrderID( resultSet.getInt( "OrderID" ) );
				order.setCustomerID( resultSet.getInt( "CustomerID" ) );
				order.setDeliveryID( resultSet.getInt( "DeliveryID" ) );
				order.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				order.setCityID( resultSet.getInt( "CityID" ) );
				order.setBranchID( resultSet.getInt( "BranchID" ));
				order.setPrescriptionID( resultSet.getInt( "PrescriptionID" ) );
				order.setOrderAddress( resultSet.getString( "OrderAddress" ) );
				order.setDateOrdered( resultSet.getDate( "DateOrdered" ) );
				order.setDateProcessed( resultSet.getDate( "DateProcessed" ) );
				order.setDateDelivered( resultSet.getDate( "DateDelivered" ) );
				order.setOrderType( resultSet.getString( "OrderType" ) );
				order.setOrderStatus( resultSet.getString( "OrderStatus" ) );
				order.setSeniorDiscount( resultSet.getBoolean( "SeniorDiscount" ) );
				order.setPaymentMethod( resultSet.getString( "PaymentMethod" ) );
				order.setActualCost( resultSet.getDouble( "ActualCost" ) );
				orders.add(order);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
	public List<Order> gettransitOrder() {
		List<Order> orders = new ArrayList<Order>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM `order` WHERE OrderStatus = 'TRANSIT'" );
			while( resultSet.next() ) {
				Order order = new Order();
				order.setOrderID( resultSet.getInt( "OrderID" ) );
				order.setCustomerID( resultSet.getInt( "CustomerID" ) );
				order.setDeliveryID( resultSet.getInt( "DeliveryID" ) );
				order.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				order.setCityID( resultSet.getInt( "CityID" ) );
				order.setBranchID( resultSet.getInt( "BranchID" ));
				order.setPrescriptionID( resultSet.getInt( "PrescriptionID" ) );
				order.setOrderAddress( resultSet.getString( "OrderAddress" ) );
				order.setDateOrdered( resultSet.getDate( "DateOrdered" ) );
				order.setDateProcessed( resultSet.getDate( "DateProcessed" ) );
				order.setDateDelivered( resultSet.getDate( "DateDelivered" ) );
				order.setOrderType( resultSet.getString( "OrderType" ) );
				order.setOrderStatus( resultSet.getString( "OrderStatus" ) );
				order.setSeniorDiscount( resultSet.getBoolean( "SeniorDiscount" ) );
				order.setPaymentMethod( resultSet.getString( "PaymentMethod" ) );
				order.setActualCost( resultSet.getDouble( "ActualCost" ) );
				orders.add(order);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
	
	public boolean DispatcherOrder(int OrderID, int UserID, int DriverID, String Comments) {
		try {
			DispatcherImplement dispatcherImplement = new DispatcherImplement();
			int DispatcherID = dispatcherImplement.getDispatcherByLogin(UserID).getDispatcherID();

			Delivery delivery = new Delivery();
			delivery.setComments(Comments);
			delivery.setDriverID(DriverID);
			delivery.setDispatcherID(DispatcherID);
			delivery.setComments(Comments);
			delivery.setPlateNumber("ASD123");
			
			DeliveryImplement deliveryImplement = new DeliveryImplement();
			int DeliveryID = deliveryImplement.addDelivery(delivery);
			
			OrderImplement orderImplement = new OrderImplement();
			orderImplement.updateOrderStatus(OrderID, "TRANSIT");
			
			return true;
		} catch (Exception e) {
			return false;			
		}
	}
}
