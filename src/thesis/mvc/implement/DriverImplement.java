package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.DriverDAO;
import thesis.mvc.model.Driver;
import thesis.mvc.utility.DBUtility;

public class DriverImplement implements DriverDAO {
	
	private Connection conn;

	public DriverImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addDriver(Driver driver) {
		try {
			String query = "INSERT INTO Driver (`DriverName`, `DriverAddress`, `DriverContactNumber`, `courierserviceID`, `InTransit`) VALUES (?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, driver.getDriverName() );
			preparedStatement.setString( 2, driver.getDriverAddress() );
			preparedStatement.setString( 3, driver.getDriverContactNumber() );
			preparedStatement.setInt(4, driver.getCourierserviceID()) ;
			preparedStatement.setBoolean(5, driver.isInTransit() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
		
	}

	@Override
	public void deleteDriver(int driverId) {
		try {
			String query = "DELETE FROM Driver where DriverID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, driverId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDriver(Driver driver) {
		try {
			String query = "UPDATE Driver SET DriverName=?, DriverAddress=?, DriverContactNumber=?, courierserviceID=?, InTransit=? WHERE DriverID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, driver.getDriverName() );
			preparedStatement.setString( 2, driver.getDriverAddress() );
			preparedStatement.setString( 3, driver.getDriverContactNumber() );
			preparedStatement.setInt(4, driver.getCourierserviceID()) ;
			preparedStatement.setBoolean(5, driver.isInTransit() );
			preparedStatement.setInt( 6, driver.getDriverID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Driver> getAllDrivers() {
		List<Driver> drivers = new ArrayList<Driver>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Driver" );
			while( resultSet.next() ) {
				Driver driver = new Driver();
				driver.setDriverID( resultSet.getInt( "DriverID" ) );
				driver.setDriverName( resultSet.getString( "DriverName" ) );
				driver.setDriverAddress( resultSet.getString( "DriverAddress" ) );
				driver.setDriverContactNumber( resultSet.getString( "DriverContactNumber" ) );
				driver.setCourierserviceID( resultSet.getInt("courierserviceID") );
				driver.setInTransit( resultSet.getBoolean( "InTransit" ) );
				drivers.add(driver);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return drivers;
	}

	@Override
	public Driver getDriverById(int driverId) {
		Driver driver = new Driver();
		try {
			String query = "SELECT * FROM Driver WHERE DriverID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, driverId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				driver.setDriverID( resultSet.getInt( "DriverID" ) );
				driver.setDriverName( resultSet.getString( "DriverName" ) );
				driver.setDriverAddress( resultSet.getString( "DriverAddress" ) );
				driver.setDriverContactNumber( resultSet.getString( "DriverContactNumber" ) );
				driver.setCourierserviceID( resultSet.getInt("courierserviceID") );
				driver.setInTransit( resultSet.getBoolean( "InTransit" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return driver;
	}
	

	public List<Driver> getDriversbyCourier(int CourierServiceId) {
		List<Driver> drivers = new ArrayList<Driver>();
		try {
			String query = "SELECT * FROM Driver WHERE DriverID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, CourierServiceId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				Driver driver = new Driver();
				driver.setDriverID( resultSet.getInt( "DriverID" ) );
				driver.setDriverName( resultSet.getString( "DriverName" ) );
				driver.setDriverAddress( resultSet.getString( "DriverAddress" ) );
				driver.setDriverContactNumber( resultSet.getString( "DriverContactNumber" ) );
				driver.setCourierserviceID( resultSet.getInt("courierserviceID") );
				driver.setInTransit( resultSet.getBoolean( "InTransit" ) );
				drivers.add(driver);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return drivers;
	}

}
