package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
import thesis.mvc.utility.DBUtility;

public class RegistrationAction {
	
	private Connection conn;

	public RegistrationAction() {
		conn = DBUtility.getConnection();
	}
	
    public boolean makeCustomer(Login login, Customer customer) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		int UserID = 0;
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE Username = ?")) {
            stmt.setString(1, login.getUsername());
            try(ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    	//Insert into Login table
        try(PreparedStatement stmt = conn.prepareStatement(""
            	+ "INSERT INTO Login "
            	+ "(Username, Password, LoginStatus, LoginLast, SignupDate, Usertype) "
            	+ "VALUES (?,?,?,?,?,?)")) {
            stmt.setString(1, login.getUsername() );
            stmt.setString(2, login.getPassword() );
            stmt.setString(3, login.getLoginStatus() );
            stmt.setDate(4, CurrentDate ); 
            stmt.setDate(5, CurrentDate ); 
            stmt.setString(6, "Customer" );
        } catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    	//Get the UserID
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM users WHERE Username = ? AND Password = ?")) {

            stmt.setString(1, login.getUsername());
            stmt.setString(2, login.getPassword());

            try(ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                	UserID = rs.getInt(1);
                }  else {
                    return false;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    	//Insert into Customer table
        try(PreparedStatement stmt = conn.prepareStatement(""
        		+ "INSERT INTO Customer "
        		+ "(UserID, CustomerName, Address, Email, IsSeniorCitizen, SeniorCitizenID, ContactNumber) " 
        		+ "VALUES (?,?,?,?,?,?,?)")) {
	        stmt.setInt( 1, UserID );            
	        stmt.setString( 2, customer.getCustomerName() );   
	        stmt.setString( 3, customer.getAddress() );        
	        stmt.setString( 4, customer.getEmail() );
	        if (customer.getSeniorCitizenID() == null) {
		        stmt.setBoolean( 5, false );
	        }
	        else {
	        	stmt.setBoolean( 5, true );
	        }
	        stmt.setString( 6, customer.getSeniorCitizenID() );   
	        stmt.setInt( 7, customer.getContactNumber() );     
	    } catch(SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
        //Audit Log
        try {
			String query = "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, UserID );
			preparedStatement.setString( 2, "Registration" );
			preparedStatement.setDate( 3, CurrentDate );
			preparedStatement.setString( 4, ""
				+ "User ID "
				+ UserID
				+ " With the username " 
				+ login.getUsername() 
				+ " made an account on " 
				+ CurrentDate);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
            return false;
		}
        return true;
    }
}
