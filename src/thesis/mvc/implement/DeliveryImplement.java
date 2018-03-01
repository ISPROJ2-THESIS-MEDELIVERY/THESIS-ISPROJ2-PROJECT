package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.DeliveryDAO;
import thesis.mvc.model.Delivery;
import thesis.mvc.utility.DBUtility;

public class DeliveryImplement implements DeliveryDAO{
	
	private Connection conn;

	public DeliveryImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addDelivery(Delivery delivery) {
		try {
			String query = "INSERT INTO Delivery (DispatcherID, DriverID, PlateNumber, Comments) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, delivery.getDispatcherID() );
			preparedStatement.setInt( 2, delivery.getDriverID() );
			preparedStatement.setString( 3, delivery.getPlateNumber() );
			preparedStatement.setString( 4, delivery.getComments() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}

	@Override
	public void deleteDelivery(int deliveryId) {
		try {
			String query = "DELETE FROM Delivery where DeliveryID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, deliveryId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDelivery(Delivery delivery) {
		try {
			String query = "UPDATE Delivery SET DispatcherID=?, DriverID=?, PlateNumber=?, Comments=? WHERE DeliveryID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, delivery.getDispatcherID() );
			preparedStatement.setInt( 2, delivery.getDriverID() );
			preparedStatement.setString( 3, delivery.getPlateNumber() );
			preparedStatement.setString( 4, delivery.getComments() );
			preparedStatement.setInt( 5, delivery.getDeliveryID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Delivery> getDelivery() {
		List<Delivery> deliveries = new ArrayList<Delivery>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Delivery" );
			while( resultSet.next() ) {
				Delivery delivery = new Delivery();
				delivery.setDeliveryID( resultSet.getInt( "DeliveryID" ) );
				delivery.setDispatcherID( resultSet.getInt( "DispatcherID" ) );
				delivery.setDriverID( resultSet.getInt( "DriverID" ) );
				delivery.setPlateNumber( resultSet.getString( "PlateNumber" ) );
				delivery.setComments( resultSet.getString( "Comments" ) );
				deliveries.add(delivery);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deliveries;
	}

	@Override
	public Delivery getDeliverybyID(int deliveryId) {
		Delivery delivery = new Delivery();
		try {
			String query = "SELECT * FROM Delivery WHERE DeliveryID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, deliveryId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				delivery.setDeliveryID( resultSet.getInt( "DeliveryID" ) );
				delivery.setDispatcherID( resultSet.getInt( "DispatcherID" ) );
				delivery.setDriverID( resultSet.getInt( "DriverID" ) );
				delivery.setPlateNumber( resultSet.getString( "PlateNumber" ) );
				delivery.setComments( resultSet.getString( "Comments" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return delivery;
	}

}
