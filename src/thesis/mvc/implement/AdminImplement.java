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

import thesis.mvc.dataobjects.AdminDAO;
import thesis.mvc.model.Admin;
import thesis.mvc.model.Login;
import thesis.mvc.utility.DBUtility;

public class AdminImplement implements AdminDAO {
	
	private Connection conn;

	public AdminImplement() {
		conn = DBUtility.getConnection();
	}
	

	@Override
	public void addAdmin(Admin admin) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, admin.getAdminID() );
			preparedStatement.setInt( 2, admin.getUserID() );
			preparedStatement.setString( 3, admin.getFirstName() );
			preparedStatement.setString( 4, admin.getSurname() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteAdmin(int adminId) {
		try {
			String query = "";
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
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, admin.getAdminID() );
			preparedStatement.setInt( 2, admin.getUserID() );
			preparedStatement.setString( 3, admin.getFirstName() );
			preparedStatement.setString( 4, admin.getSurname() );
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
