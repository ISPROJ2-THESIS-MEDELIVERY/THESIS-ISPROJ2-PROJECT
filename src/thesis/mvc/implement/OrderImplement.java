package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	public void addOrder(Order order) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, order.getCustomerID() );
			preparedStatement.setInt( 2, order.getDeliveryID() );
			preparedStatement.setInt( 3, order.getPharmacistID() );
			preparedStatement.setInt( 4, order.getCityID() );
			preparedStatement.setInt( 5, order.getPrescriptionID() );
			preparedStatement.setString( 6, order.getOrderAddress() );
			preparedStatement.setDate( 7, order.getDateOrdered() );
			preparedStatement.setDate( 8, order.getDateProcessed() );
			preparedStatement.setDate( 9, order.getDateDelivered() );
			preparedStatement.setString( 10, order.getOrderType() );
			preparedStatement.setString( 11, order.getOrderStatus() );
			preparedStatement.setBoolean( 12, order.getSeniorDiscount() );
			preparedStatement.setString( 13, order.getPaymentMethod() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrder(int orderId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOrder(Order order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> getOrder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order getOrderById(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

}
