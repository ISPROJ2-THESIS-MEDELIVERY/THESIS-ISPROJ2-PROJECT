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

import javax.print.attribute.standard.DateTimeAtCompleted;

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
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime())
			//String query = "insert into customer (firstName, lastName, middleName, creditCardNo, billingStreet, billingAddress, phoneNo) values (?,?,?,?,?,?,?)";
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
			//String query = "delete from customer where customerId=?";
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
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime())
			//String query = "insert into customer (firstName, lastName, middleName, creditCardNo, billingStreet, billingAddress, phoneNo) values (?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, login.getUsername() );
			preparedStatement.setString( 2, login.getPassword() );
			preparedStatement.setString( 3, login.getLoginStatus() );
			preparedStatement.setDate( 4, CurrentDate );
			preparedStatement.setDate( 5, CurrentDate );
			preparedStatement.setString( 6, login.getUsertype() );
			preparedStatement.setInt( 7, login.getUserID() );
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
			ResultSet resultSet = statement.executeQuery( "select * from customer" );
			while( resultSet.next() ) {
				Login login = new Login();
				login.set( resultSet.getInt( "UserID" ) );
				login.set( resultSet.getString( "Username" ) );
				login.set( resultSet.getString( "Password" ) );
				login.set( resultSet.getString( "LoginStatus" ) );
				login.set( resultSet.getDate( "LoginLast" ) );
				login.set( resultSet.getDate( "SignupDate" ) );
				login.set( resultSet.getString( "Usertype" ) );
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
		// TODO Auto-generated method stub
		return null;
	}

}
