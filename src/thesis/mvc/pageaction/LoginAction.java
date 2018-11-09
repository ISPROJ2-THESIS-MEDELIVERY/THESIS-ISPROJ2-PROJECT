package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.model.Audit;
import thesis.mvc.model.Login;
import thesis.mvc.utility.DBUtility;

public class LoginAction {
	
	private Connection conn;

	public LoginAction() {
		conn = DBUtility.getConnection();
	}
	

    public int loginUser(String Username, String Password) {
        
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID, LoginStatus FROM login WHERE Username = ? AND Password = ?")) {

            stmt.setString(1, Username);
            stmt.setString(2, Password);

            try(ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    //Audit Log
            		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
                    Audit audit = new Audit();
                    audit.setUserID(rs.getInt(1));
                    audit.setLogType("Login");
                    audit.setTimestamp(CurrentDate);
                    audit.setActionTaken("User ID " + rs.getInt(1) + " With the username " + Username + " Logged in.");
                    AuditImplement AuditImp = new AuditImplement();
                    AuditImp.addAudit(audit);
                	
            		Login login = new Login();
            		LoginImplement loginImplement = new LoginImplement();
            		login = loginImplement.getLoginByID(rs.getInt(1));
            		login.setLoginStatus("Logged In");
            		
            		if (rs.getString(2).equalsIgnoreCase("Just Registered")) {
            			return -1;
            		}
            		else {
            			return rs.getInt(1);
            		}
                }  else {
                    return 0;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    	
    }

    public void logoutUser(int UserID, String Username) {
		//Audit
		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
		Audit audit = new Audit();
		audit.setUserID(UserID);
		audit.setLogType("Logout");
		audit.setTimestamp(CurrentDate);
		audit.setActionTaken("User ID " + UserID + " With the username " + Username + " Logged out.");
		AuditImplement AuditImp = new AuditImplement();
		AuditImp.addAudit(audit);
    	
		Login login = new Login();
		LoginImplement loginImplement = new LoginImplement();
		login = loginImplement.getLoginByID(UserID);
		login.setLoginStatus("Logged Out");
		
    }

    public boolean checkSeniorStatus(int loginID) {
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Customer WHERE UserID = ?")) {
	        stmt.setInt(1, loginID);
	        try(ResultSet rs = stmt.executeQuery()) {
	           if (rs.next()) {
	        	   
	        	   return true;
	           }
	        }
	    } catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
    }
	public int checkUserType(int loginID) {
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Customer WHERE UserID = ?")) {
	        stmt.setInt(1, loginID);
	        try(ResultSet rs = stmt.executeQuery()) {
	           if (rs.next()) { return 1; }
	        }
	    } catch (SQLException e) {
			e.printStackTrace();
		}
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Dispatcher WHERE UserID = ?")) {
	        stmt.setInt(1, loginID);
	        try(ResultSet rs = stmt.executeQuery()) {
	           if (rs.next()) { return 2; }
	        }
	    } catch (SQLException e) {
			e.printStackTrace();
		}
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Pharmacist WHERE UserID = ?")) {
	        stmt.setInt(1, loginID);
	        try(ResultSet rs = stmt.executeQuery()) {
	           if (rs.next()) { return 3; }
	        }
	    } catch (SQLException e) {
			e.printStackTrace();
		}
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Admin WHERE UserID = ?")) {
	        stmt.setInt(1, loginID);
	        try(ResultSet rs = stmt.executeQuery()) {
	           if (rs.next()) { return 4; }
	        }
	    } catch (SQLException e) {
			e.printStackTrace();
		}
        return 0;
		
	}

}
