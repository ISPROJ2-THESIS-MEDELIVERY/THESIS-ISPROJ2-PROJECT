package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import thesis.mvc.dataobjects.OrderDAO;
import thesis.mvc.model.Order;
import thesis.mvc.utility.DBUtility;

public class OrderImplement implements OrderDAO{
	
	private Connection conn;

	public OrderImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addOrder(Order order) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO `order` (CustomerID, DeliveryID, PharmacistID, BranchID, CityID, PrescriptionID, OrderAddress, DateOrdered, DateProcessed, DateDelivered, OrderType, OrderStatus, SeniorDiscount, PaymentMethod, ActualCost) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, order.getCustomerID() );
			preparedStatement.setInt( 2, order.getDeliveryID() );
			preparedStatement.setInt( 3, order.getPharmacistID() );
			preparedStatement.setInt( 4, order.getBranchID() );
			preparedStatement.setInt( 5, order.getCityID() );
			preparedStatement.setInt( 6, order.getPrescriptionID() );
			preparedStatement.setString( 7, order.getOrderAddress() );
			preparedStatement.setDate( 8, CurrentDate );
			preparedStatement.setDate( 9, order.getDateProcessed() );
			preparedStatement.setDate( 10, order.getDateDelivered() );
			preparedStatement.setString( 11, order.getOrderType() );
			preparedStatement.setString( 12, order.getOrderStatus() );
			preparedStatement.setBoolean( 13, order.getSeniorDiscount() );
			preparedStatement.setString( 14, order.getPaymentMethod() );
			preparedStatement.setDouble(15, order.getActualCost() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void deleteOrder(int orderId) {
		try {
			String query = "DELETE FROM `order` where OrderID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, orderId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrder(Order order) {
		try {
			String query = "UPDATE `order` SET CustomerID=?, DeliveryID=?, PharmacistID=?, CityID=?, BranchID-?, PrescriptionID=?, OrderAddress=?, DateOrdered=?, DateProcessed=?, DateDelivered=?, OrderType=?, OrderStatus=?, SeniorDiscount=?, PaymentMethod=?, ActualCost=? WHERE OrderID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, order.getCustomerID() );
			preparedStatement.setInt( 2, order.getDeliveryID() );
			preparedStatement.setInt( 3, order.getPharmacistID() );
			preparedStatement.setInt( 4, order.getCityID() );
			preparedStatement.setInt( 5, order.getBranchID() );
			preparedStatement.setInt( 6, order.getPrescriptionID() );
			preparedStatement.setString( 7, order.getOrderAddress() );
			preparedStatement.setDate( 8, order.getDateProcessed() );
			preparedStatement.setDate( 9, order.getDateDelivered() );
			preparedStatement.setString( 10, order.getOrderType() );
			preparedStatement.setString( 11, order.getOrderStatus() );
			preparedStatement.setBoolean( 12, order.getSeniorDiscount() );
			preparedStatement.setString( 13, order.getPaymentMethod() );
			preparedStatement.setDouble(14, order.getActualCost() );
			preparedStatement.setInt( 15, order.getOrderID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Order> getOrder() {
		List<Order> orders = new ArrayList<Order>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM `order`" );
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

	@Override
	public Order getOrderById(int orderId) {
		Order order = new Order();
		try {
			String query = "SELECT * FROM `order` WHERE OrderID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, orderId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
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
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}
	public void updateOrderStatus(int OrderID, String Status) {
		try {
			String query = "UPDATE `order` SET OrderStatus=? WHERE OrderID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, Status );
			preparedStatement.setInt( 2, OrderID );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateOrderPayment(int OrderID, String Payment) {
		try {
			String query = "UPDATE `order` SET PaymentMethod=?, OrderStatus='PAID' WHERE OrderID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, Payment );
			preparedStatement.setInt( 2, OrderID );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<Order> getPendingOrder(int CID) {
		List<Order> orders = new ArrayList<Order>();
		try {
			String query = "SELECT * FROM `order` WHERE OrderStatus='APPROVED' AND CustomerID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, CID);			
			ResultSet resultSet = preparedStatement.executeQuery();
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
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
	
}
