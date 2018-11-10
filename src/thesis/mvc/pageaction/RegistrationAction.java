package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import thesis.mvc.implement.*;
import thesis.mvc.model.*;
import thesis.mvc.utility.DBUtility;

public class RegistrationAction {
	
	private Connection conn;
	Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());

	public RegistrationAction() {
		conn = DBUtility.getConnection();
	}
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	
    public int makeCustomer(Login login, Customer customer) {
		int UserID = 0;
		
    	//Check if user-name is used
    	try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
            stmt.setString(1, login.getUsername());
            try(ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    	
    	//Insert into Login table
    	LoginImplement LoginImp = new LoginImplement();
    	login.setLoginStatus("Just Registered");
    	login.setUsertypeID(1);
    	try {
        	LoginImp.addLogin(login);
    	} catch (Exception e) {
    		e.printStackTrace();
    		return 0;
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
                    return 0;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    	
    	//Insert into Customer table
    	CustomerImplement CustomerImp = new CustomerImplement();
    	customer.setUserID(UserID);
    	/*
        if (customer.getSeniorCitizenID() == null) {
        	customer.setIsSeniorCitizen(false);
        } else {
        	customer.setIsSeniorCitizen(true);
        }
        */
        try {
        	CustomerImp.addCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
        
        //Audit Log
        Audit audit = new Audit();
        audit.setUserID(UserID);
        audit.setLogType("CustReg");
        audit.setTimestamp(CurrentDate);
        audit.setActionTaken("User ID " + UserID + " With the username " + login.getUsername() + " made an account.");
        AuditImplement AuditImp = new AuditImplement();
        AuditImp.addAudit(audit);
        return UserID;
    }
    
    public void InsertSenior (int CID, String SeniorID, String SeniorPath) {
    	OrderImplement orderImplement = new OrderImplement();
    	Order order = orderImplement.getOrderById(CID);
    	order.setSeniorDiscount(true);
    	
    	
    }
    
    public boolean makeDispatcher(Login login, Dispatcher dispatcher) {
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
    	login.setLoginStatus("Normal");
    	login.setUsertypeID(2);
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
    	login.setLoginStatus("Normal");
    	login.setUsertypeID(3);
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
    public String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    
	public boolean makeAdmin(Login login, Admin admin) {
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
    	login.setLoginStatus("Normal");
    	login.setUsertypeID(4);
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
    
}
