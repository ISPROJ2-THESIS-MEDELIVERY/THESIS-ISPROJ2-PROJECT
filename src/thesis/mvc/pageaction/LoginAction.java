package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.model.Audit;
import thesis.mvc.utility.DBUtility;

public class LoginAction {
	
	private Connection conn;

	public LoginAction() {
		conn = DBUtility.getConnection();
	}
	

    public int loginUser(String Username, String Password) {
        
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

            stmt.setString(1, Username);
            stmt.setString(2, Password);

            try(ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    //Audit Log
            		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
                    Audit audit = new Audit();
                    audit.setUserID(rs.getInt(1));
                    audit.setLogType("Login");
                    audit.setTimestamp(CurrentDate);
                    audit.setActionTaken("User ID " + rs.getInt(1) + " With the username " + Username + " Logged in.");
                    AuditImplement AuditImp = new AuditImplement();
                    AuditImp.addAudit(audit);
                	return rs.getInt(1);
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
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		Audit audit = new Audit();
		audit.setUserID(UserID);
		audit.setLogType("Logout");
		audit.setTimestamp(CurrentDate);
		audit.setActionTaken("User ID " + UserID + " With the username " + Username + " Logged out.");
		AuditImplement AuditImp = new AuditImplement();
		AuditImp.addAudit(audit);
    	
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
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM mydb.Admin WHERE UserID = ?")) {
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
