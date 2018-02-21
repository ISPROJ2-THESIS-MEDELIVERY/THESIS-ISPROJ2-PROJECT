package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.model.Admin;
import thesis.mvc.utility.DBUtility;

public class HomeAction {
	
	private Connection conn;

	public HomeAction() {
		conn = DBUtility.getConnection();
	}
	
	
	public void displayStock() {
		List<Admin> admins = new ArrayList<Admin>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Admin WHERE " );
			while( resultSet.next() ) {
				Admin admin = new Admin();
				resultSet.getInt( "AdminID" );
				resultSet.getInt( "UserID" );
				resultSet.getString( "FirstName" );
				resultSet.getString( "Surname" );
				admins.add(admin);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
