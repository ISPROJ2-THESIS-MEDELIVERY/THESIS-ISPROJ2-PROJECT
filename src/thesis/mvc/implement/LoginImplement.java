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

import thesis.mvc.dataobjects.LoginDAO;
import thesis.mvc.model.Login;
import thesis.mvc.utility.DBUtility;

public class LoginImplement implements LoginDAO {
	
	private Connection conn;

	public LoginImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addLogin(Login login) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO Login (Username, Password, LoginStatus, LoginLast, SignupDate, Usertype) VALUES (?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, login.getUsername() );
			preparedStatement.setString( 2, login.getPassword() );
			preparedStatement.setString( 3, login.getLoginStatus() );
			preparedStatement.setDate( 4, CurrentDate );
			preparedStatement.setDate( 5, CurrentDate );
			preparedStatement.setString( 6, login.getUsertype() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteLogin(int loginId) {
		try {
			String query = "DELETE FROM Login where UserID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, loginId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateLogin(Login login) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "UPDATE Login SET Username=?, Password=?, LoginStatus=?, LoginLast=?, SignupDate=?, Usertype=? WHERE UserID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, login.getUsername() );
			preparedStatement.setString( 2, login.getPassword() );
			preparedStatement.setString( 3, login.getLoginStatus() );
			preparedStatement.setDate( 4, CurrentDate );
			preparedStatement.setString( 5, login.getUsertype() );
			preparedStatement.setInt( 6, login.getUserID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<Login> getAllLogins() {
		List<Login> logins = new ArrayList<Login>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Login" );
			while( resultSet.next() ) {
				Login login = new Login();
				login.setUserID( resultSet.getInt( "UserID" ) );
				login.setUsername( resultSet.getString( "Username" ) );
				login.setPassword( resultSet.getString( "Password" ) );
				login.setLoginStatus( resultSet.getString( "LoginStatus" ) );
				login.setLoginLast( resultSet.getDate( "LoginLast" ) );
				login.setSignupDate( resultSet.getDate( "SignupDate" ) );
				login.setUsertype( resultSet.getString( "Usertype" ) );
				logins.add(login);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logins;
	}

	@Override
	public Login getLoginByID(int loginId) {
		Login login = new Login();
		try {
			String query = "SELECT * FROM Login WHERE UserID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, loginId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				login.setUserID( resultSet.getInt( "UserID" ) );
				login.setUsername( resultSet.getString( "Username" ) );
				login.setPassword( resultSet.getString( "Password" ) );
				login.setLoginStatus( resultSet.getString( "LoginStatus" ) );
				login.setLoginLast( resultSet.getDate( "LoginLast" ) );
				login.setSignupDate( resultSet.getDate( "SignupDate" ) );
				login.setUsertype( resultSet.getString( "Usertype" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return login;
	}

}
