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
			String query = "INSERT INTO Driver (DriverName, DriverAddress, DriverContactNumber) VALUES (?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, driver.getDriverName() );
			preparedStatement.setString( 2, driver.getDriverAddress() );
			preparedStatement.setString( 3, driver.getDriverContactNumber() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, 3 ); //3 is a placeholder
			preparedStatement.setString( 2, "create, update or delete" ); //placeholder
			preparedStatement.setDate( 3, CurrentDate );
			preparedStatement.setString( 4, "User with ID " + "" );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
			String query = "UPDATE Driver SET DriverName=?, DriverAddress=?, DriverContactNumber=? WHERE DriverID=?";
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
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Driver" );
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
			String query = "SELECT * FROM Driver WHERE DriverID=?";
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
