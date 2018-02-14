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
	public void addDriver(Driver driver) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, driver.getDriverName() );
			preparedStatement.setString( 2, driver.getDriverAddress() );
			preparedStatement.setString( 3, driver.getDriverContactNumber() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDriver(int driverId) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, driverId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteDriver(Driver driver) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, driver.getDriverName() );
			preparedStatement.setString( 2, driver.getDriverAddress() );
			preparedStatement.setString( 3, driver.getDriverContactNumber() );
			preparedStatement.setInt( 4, driver.getDriverID() );
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
			ResultSet resultSet = statement.executeQuery( "" );
			while( resultSet.next() ) {
				Driver driver = new Driver();
				driver.setDriverID( resultSet.getInt( "DriverID" ) );
				driver.setDriverName( resultSet.getString( "DriverName" ) );
				driver.setDriverAddress( resultSet.getString( "DriverAddress" ) );
				driver.setDriverContactNumber( resultSet.getString( "DriverContactNumber" ) );
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
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, driverId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				driver.setDriverID( resultSet.getInt( "DriverID" ) );
				driver.setDriverName( resultSet.getString( "DriverName" ) );
				driver.setDriverAddress( resultSet.getString( "DriverAddress" ) );
				driver.setDriverContactNumber( resultSet.getString( "DriverContactNumber" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return driver;
	}

}
