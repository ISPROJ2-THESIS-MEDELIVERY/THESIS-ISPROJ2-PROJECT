package thesis.mvc.pageaction;

import java.sql.Connection;
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
		List<Display> displays = new ArrayList<Display>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( ""
					+ "SELECT P.ProductName, B.PharmacyName, S.Quantity\r\n"
					+ "FROM Stocks S WHERE S.Feature = 1\r\n"
					+ "INNER JOIN Product P ON S.ProductID = P.ProductID\r\n"
					+ "INNER JOIN Branch B ON S.BranchID = B.BranchID");
			while( resultSet.next() ) {
				Display display = new Admin();
				resultSet.getInt( "AdminID" );
				resultSet.getInt( "UserID" );
				resultSet.getString( "FirstName" );
				resultSet.getString( "Surname" );
				displays.add(display);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
