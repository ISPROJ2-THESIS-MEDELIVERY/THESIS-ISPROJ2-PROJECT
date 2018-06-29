package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import thesis.mvc.implement.*;
import thesis.mvc.model.*;
import thesis.mvc.pageaction.ReportAction.CustomerSales;
import thesis.mvc.utility.DBUtility;

public class RegistrationAction {
	
	private Connection conn;

	public RegistrationAction() {
		conn = DBUtility.getConnection();
	}
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	
    public boolean makeCustomer(Login login, Customer customer) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		int UserID = 0;
		
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
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
    	LoginImplement LoginImp = new LoginImplement();
    	login.setLoginStatus("Just Registered");
    	login.setUsertype("Customer");
    	try {
        	LoginImp.addLogin(login);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    	
    	//Get the UserID
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

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
    	CustomerImplement CustomerImp = new CustomerImplement();
    	customer.setUserID(UserID);
    	customer.setCityID(1);//Address
    	customer.setAddress("test");
        if (customer.getSeniorCitizenID() == null) {
        	customer.setIsSeniorCitizen(false);
        } else {
        	customer.setIsSeniorCitizen(true);
        }
        try {
        	CustomerImp.addCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
        
        //Audit Log
        Audit audit = new Audit();
        audit.setUserID(UserID);
        audit.setLogType("CustReg");
        audit.setTimestamp(CurrentDate);
        audit.setActionTaken("User ID " + UserID + " With the username " + login.getUsername() + " made an account.");
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
        return true;
    }
    
	public boolean makeAdmin(Login login, Admin admin) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		int UserID = 0;
		
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
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
    	LoginImplement LoginImp = new LoginImplement();
    	login.setLoginStatus("Just Registered");
    	login.setUsertype("Admin");
    	try {
    		LoginImp.addLogin(login);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	
    	//Get the UserID
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

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
    	
    	//Insert into Admin table
    	AdminImplement AdminImp = new AdminImplement();
    	admin.setUserID(UserID);
    	try {
    		AdminImp.addAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
        
        //Audit Log
        Audit audit = new Audit();
        audit.setUserID(UserID);
        audit.setLogType("AdmnReg");
        audit.setTimestamp(CurrentDate);
        audit.setActionTaken("User ID " + UserID + " With the username " + login.getUsername() + " made an account.");
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
        return true;
    }
    
    public boolean makeDispatcher(Login login, Dispatcher dispatcher) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		int UserID = 0;
		
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
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
    	LoginImplement LoginImp = new LoginImplement();
    	login.setLoginStatus("Just Registered");
    	login.setUsertype("Dispatcher");
    	try {
    		LoginImp.addLogin(login);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	
    	//Get the UserID
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

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
    	
    	//Insert into Dispatcher table
    	DispatcherImplement DispatcherImp = new DispatcherImplement();
    	dispatcher.setUserID(UserID);
    	try {
    		DispatcherImp.addDispatcher(dispatcher);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
        
        //Audit Log
        Audit audit = new Audit();
        audit.setUserID(UserID);
        audit.setLogType("DispReg");
        audit.setTimestamp(CurrentDate);
        audit.setActionTaken("User ID " + UserID + " With the username " + login.getUsername() + " made an account.");
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
        return true;
    }
    
    public boolean makePharmacist(Login login, Pharmacist pharmacist) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		int UserID = 0;
		
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
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
    	LoginImplement LoginImp = new LoginImplement();
    	login.setLoginStatus("Just Registered");
    	login.setUsertype("Pharmacist");
    	try {
    		LoginImp.addLogin(login);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    	
    	//Get the UserID
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

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
    	
    	//Insert into Pharmacist table
    	PharmacistImplement PharmacistImp = new PharmacistImplement();
    	pharmacist.setUserID(UserID);
    	try {
    		PharmacistImp.addPharmacist(pharmacist);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	        
        //Audit Log
        Audit audit = new Audit();
        audit.setUserID(UserID);
        audit.setLogType("PharReg");
        audit.setTimestamp(CurrentDate);
        audit.setActionTaken("User ID " + UserID + " With the username " + login.getUsername() + " made an account.");
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
        return true;
    }
    
}
