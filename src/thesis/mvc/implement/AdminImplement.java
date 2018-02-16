package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.AdminDAO;
import thesis.mvc.model.Admin;
import thesis.mvc.utility.DBUtility;

public class AdminImplement implements AdminDAO {
	
	private Connection conn;

	public AdminImplement() {
		conn = DBUtility.getConnection();
	}
	

	@Override
	public void addAdmin(Admin admin) {
		try {
			String query = "INSERT INTO Admin (UserID, FirstName, Surname) VALUES (?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, admin.getUserID() );
			preparedStatement.setString( 2, admin.getFirstName() );
			preparedStatement.setString( 3, admin.getSurname() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteAdmin(int adminId) {
		try {
			String query = "DELETE FROM Admin where AdminID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, adminId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void UpdateAdmin(Admin admin) {
		try {
			String query = "UPDATE Customer SET UserID=?, FirstName=?, Surname=? WHERE AdminID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, admin.getUserID() );
			preparedStatement.setString( 2, admin.getFirstName() );
			preparedStatement.setString( 3, admin.getSurname() );
			preparedStatement.setInt( 4, admin.getAdminID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Admin> getAllAdmins() {
		List<Admin> admins = new ArrayList<Admin>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "" );
			while( resultSet.next() ) {
				Admin admin = new Admin();
				admin.setAdminID( resultSet.getInt( "AdminID" ) );
				admin.setUserID( resultSet.getInt( "UserID" ) );
				admin.setFirstName( resultSet.getString( "FirstName" ) );
				admin.setSurname( resultSet.getString( "Surname" ) );
				admins.add(admin);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admins;
	}

	@Override
	public Admin getAdminById(int adminId) {
		Admin admin = new Admin();
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, adminId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				admin.setAdminID( resultSet.getInt( "AdminID" ) );
				admin.setUserID( resultSet.getInt( "UserID" ) );
				admin.setFirstName( resultSet.getString( "FirstName" ) );
				admin.setSurname( resultSet.getString( "Surname" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
	

}
