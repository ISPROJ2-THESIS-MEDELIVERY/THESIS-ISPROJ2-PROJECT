package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.UniversalBean;

import javax.faces.bean.ManagedProperty;

public class LoginAction {

	//Global variables
    @ManagedProperty(value="#{UniversalBean}")
    private UniversalBean GV;
	
	private Connection conn;

	public LoginAction() {
		conn = DBUtility.getConnection();
	}
	

    public boolean loginUser(String Username, String Password) {
        
    	try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "SELECT UserID FROM login WHERE Username = ? AND Password = ?")) {

            stmt.setString(1, Username);
            stmt.setString(2, Password);

            try(ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                	GV.setLoggedInId(rs.getInt(1));
                	GV.setLoggedInUsername(Username);
                }  else {
                    return false;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    	return true;
    	
    }

}
