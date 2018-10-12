package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.CustomerDAO;
import thesis.mvc.model.Customer;
import thesis.mvc.utility.DBUtility;

public class CustomerImplement implements CustomerDAO{
	
	private Connection conn;

	public CustomerImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addCustomer(Customer customer) {
		try(PreparedStatement stmt = conn.prepareStatement(""
        		+ "INSERT INTO Customer "
        		+ "(`CustomerID`, `UserID`, `CustomerName`, `CustomerStreet`, `CustomerBarangay`, `CityID`, `CustomerProvince`, `CustomerLandline`, `CustomerCellular`, `Email`, `IsSeniorCitizen`, `SeniorCitizenID`) " 
        		+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)")) {
			stmt.setInt( 1, customer.getUserID() );
			stmt.setString( 2, customer.getCustomerName() );
			stmt.setString( 3, customer.getCustomerStreet() );
			stmt.setString( 4, customer.getCustomerBarangay() );
			stmt.setInt(5, customer.getCityID());
			stmt.setString( 6, customer.getCustomerProvince() );
			stmt.setString( 7, customer.getCustomerLandline() );
			stmt.setString( 8, customer.getCustomerCellular() );
			stmt.setString( 9, customer.getEmail() );
			stmt.setBoolean( 10, customer.isIsSeniorCitizen() );
			stmt.setString( 11, customer.getSeniorCitizenID() );
			int NewID = stmt.executeUpdate();
			stmt.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public void deleteCustomer(int customerId) {
		try {
			String query = "DELETE FROM Customer where CustomerID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, customerId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateCustomer(Customer customer) {
		try {
			String query = "UPDATE Customer SET "
					+ "`UserID`=?,"
					+ "`CustomerName`=?,"
					+ "`CustomerStreet`=?,"
					+ "`CustomerBarangay`=?,"
					+ "`CityID`=?,"
					+ "`CustomerProvince`=?,"
					+ "`CustomerLandline`=?,"
					+ "`CustomerCellular`=?,"
					+ "`Email`=?,"
					+ "`IsSeniorCitizen`=?,"
					+ "`SeniorCitizenID`=?"
					+ " WHERE CustomerID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, customer.getUserID() );
			preparedStatement.setString( 2, customer.getCustomerName() );    
			preparedStatement.setString( 3, customer.getCustomerStreet() );  
			preparedStatement.setString( 4, customer.getCustomerBarangay() );
			preparedStatement.setInt(5, customer.getCityID());               
			preparedStatement.setString( 6, customer.getCustomerProvince() );
			preparedStatement.setString( 7, customer.getCustomerLandline() );
			preparedStatement.setString( 8, customer.getCustomerCellular() );
			preparedStatement.setString( 9, customer.getEmail() );           
			preparedStatement.setBoolean( 10, customer.isIsSeniorCitizen() );
			preparedStatement.setString( 11, customer.getSeniorCitizenID() );
			preparedStatement.setInt( 12, customer.getCustomerID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Customer> getAllCustomers() {
		List<Customer> customers = new ArrayList<Customer>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Customer" );
			while( resultSet.next() ) {
				Customer customer = new Customer();
				customer.setCustomerID( resultSet.getInt( "CustomerID" ) );
				customer.setUserID( resultSet.getInt( "UserID" ) );
				customer.setCustomerName( resultSet.getString( "CustomerName" ) );
				customer.setCustomerStreet( resultSet.getString("CustomerStreet") );
				customer.setCustomerBarangay( resultSet.getString("CustomerBarangay") );
				customer.setCityID( resultSet.getInt("CityID") );
				customer.setCustomerProvince( resultSet.getString("CustomerProvince") );
				customer.setCustomerLandline( resultSet.getString("CustomerLandline") );
				customer.setCustomerCellular( resultSet.getString("CustomerCellular") );
				customer.setEmail( resultSet.getString( "Email" ) );
				customer.setIsSeniorCitizen( resultSet.getBoolean( "IsSeniorCitizen" ) );
				customer.setSeniorCitizenID( resultSet.getString( "SeniorCitizenID" ) );
				customers.add(customer);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customers;
	}

	@Override
	public Customer getCustomerById(int customerId) {
		Customer customer = new Customer();
		try {
			String query = "SELECT * FROM Customer WHERE CustomerID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, customerId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				customer.setCustomerID( resultSet.getInt( "CustomerID" ) );
				customer.setUserID( resultSet.getInt( "UserID" ) );
				customer.setCustomerName( resultSet.getString( "CustomerName" ) );
				customer.setCustomerStreet( resultSet.getString("CustomerStreet") );
				customer.setCustomerBarangay( resultSet.getString("CustomerBarangay") );
				customer.setCityID( resultSet.getInt("CityID") );
				customer.setCustomerProvince( resultSet.getString("CustomerProvince") );
				customer.setCustomerLandline( resultSet.getString("CustomerLandline") );
				customer.setCustomerCellular( resultSet.getString("CustomerCellular") );
				customer.setEmail( resultSet.getString( "Email" ) );
				customer.setIsSeniorCitizen( resultSet.getBoolean( "IsSeniorCitizen" ) );
				customer.setSeniorCitizenID( resultSet.getString( "SeniorCitizenID" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}
	public Customer getCustomerByUserId(int UserID) {
		Customer customer = new Customer();
		try {
			String query = "SELECT * FROM Customer WHERE UserID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, UserID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				customer.setCustomerID( resultSet.getInt( "CustomerID" ) );
				customer.setUserID( resultSet.getInt( "UserID" ) );
				customer.setCustomerName( resultSet.getString( "CustomerName" ) );
				customer.setCustomerStreet( resultSet.getString("CustomerStreet") );
				customer.setCustomerBarangay( resultSet.getString("CustomerBarangay") );
				customer.setCityID( resultSet.getInt("CityID") );
				customer.setCustomerProvince( resultSet.getString("CustomerProvince") );
				customer.setCustomerLandline( resultSet.getString("CustomerLandline") );
				customer.setCustomerCellular( resultSet.getString("CustomerCellular") );
				customer.setEmail( resultSet.getString( "Email" ) );
				customer.setIsSeniorCitizen( resultSet.getBoolean( "IsSeniorCitizen" ) );
				customer.setSeniorCitizenID( resultSet.getString( "SeniorCitizenID" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

}
