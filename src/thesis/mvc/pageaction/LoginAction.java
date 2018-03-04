package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}
