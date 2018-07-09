package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.OrderDetailDAO;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.utility.DBUtility;

public class OrderDetailImplement implements OrderDetailDAO {
	
	private Connection conn;

	public OrderDetailImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addOrderDetail(OrderDetail orderDetail) {
		try {
			String query = "INSERT INTO OrderDetail (OrderID, ProductID, Quantity, CostPerUnit, TotalCost) VALUES (?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, orderDetail.getOrderID() );
			preparedStatement.setInt( 2, orderDetail.getProductID() );
			preparedStatement.setInt( 3, orderDetail.getQuantity() );
			preparedStatement.setDouble( 4, orderDetail.getCostPerUnit() );
			preparedStatement.setDouble( 5, orderDetail.getTotalCost() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
		
	}

	@Override
	public void deleteOrderDetail(int orderDetailId) {
		try {
			String query = "DELETE FROM OrderDetail where OrderDetailsID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, orderDetailId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOrderDetail(OrderDetail orderDetail) {
		try {
			String query = "UPDATE OrderDetail SET OrderID=?, ProductID=?, Quantity=?, CostPerUnit=?, TotalCost=? WHERE OrderDetailsID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, orderDetail.getOrderID() );
			preparedStatement.setInt( 2, orderDetail.getProductID() );
			preparedStatement.setInt( 3, orderDetail.getQuantity() );
			preparedStatement.setDouble( 4, orderDetail.getCostPerUnit() );
			preparedStatement.setDouble( 5, orderDetail.getTotalCost() );
			preparedStatement.setInt( 6, orderDetail.getOrderDetailsID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<OrderDetail> getOrderDetail() {
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM OrderDetail" );
			while( resultSet.next() ) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderDetailsID( resultSet.getInt( "OrderDetailsID" ) );
				orderDetail.setOrderID( resultSet.getInt( "OrderID" ) );
				orderDetail.setProductID( resultSet.getInt( "ProductID" ) );
				orderDetail.setQuantity( resultSet.getInt( "Quantity" ) );
				orderDetail.setCostPerUnit( resultSet.getDouble( "CostPerUnit" ) );
				orderDetail.setTotalCost( resultSet.getDouble( "TotalCost" ) );
				orderDetails.add(orderDetail);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderDetails;
	}
	
	public List<OrderDetail> getspecificOrderDetail(int OrderID) {
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		try {
			String query = "SELECT * FROM OrderDetail WHERE OrderID = ?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, OrderID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderDetailsID( resultSet.getInt( "OrderDetailsID" ) );
				orderDetail.setOrderID( resultSet.getInt( "OrderID" ) );
				orderDetail.setProductID( resultSet.getInt( "ProductID" ) );
				orderDetail.setQuantity( resultSet.getInt( "Quantity" ) );
				orderDetail.setCostPerUnit( resultSet.getDouble( "CostPerUnit" ) );
				orderDetail.setTotalCost( resultSet.getDouble( "TotalCost" ) );
				orderDetails.add(orderDetail);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderDetails;
	}

	@Override
	public OrderDetail getOrderDetailById(int orderDetailId) {
		OrderDetail orderDetail = new OrderDetail();
		try {
			String query = "SELECT * FROM OrderDetail WHERE OrderDetailsID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, orderDetailId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				orderDetail.setOrderDetailsID( resultSet.getInt( "OrderDetailsID" ) );
				orderDetail.setOrderID( resultSet.getInt( "OrderID" ) );
				orderDetail.setProductID( resultSet.getInt( "ProductID" ) );
				orderDetail.setQuantity( resultSet.getInt( "Quantity" ) );
				orderDetail.setCostPerUnit( resultSet.getDouble( "CostPerUnit" ) );
				orderDetail.setTotalCost( resultSet.getDouble( "TotalCost" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderDetail;
	}

}
