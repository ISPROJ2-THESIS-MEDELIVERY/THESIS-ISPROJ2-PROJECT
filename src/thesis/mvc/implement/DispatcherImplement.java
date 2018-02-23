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

import thesis.mvc.dataobjects.DispatcherDAO;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.utility.DBUtility;

public class DispatcherImplement implements DispatcherDAO{
		
		private Connection conn;

		public DispatcherImplement() {
			conn = DBUtility.getConnection();
		}
		

	@Override
	public void addDispatcher(Dispatcher dispatcher) {
		try {
			String query = "INSERT INTO Dispatcher (CourierServiceID, UserID, FirstName, LastName, ContactNumber, Address, Birthdate) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, dispatcher.getCourierServiceID() );
			preparedStatement.setInt( 2, dispatcher.getUserID() );
			preparedStatement.setString( 3, dispatcher.getFirstName() );
			preparedStatement.setString( 4, dispatcher.getLastName() );
			preparedStatement.setInt( 5, dispatcher.getContactNumber() );
			preparedStatement.setString( 6, dispatcher.getAddress() );
			preparedStatement.setDate( 7, dispatcher.getBirthdate() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, 3 ); //3 is a placeholder
			preparedStatement.setString( 2, "create, update or delete" ); //placeholder
			preparedStatement.setDate( 3, CurrentDate );
			preparedStatement.setString( 4, "User with ID " + dispatcher.getUserID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteDispatcher(int dispatcherId) {
		try {
			String query = "DELETE FROM Dispatcher where DispatcherID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, dispatcherId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDispatcher(Dispatcher dispatcher) {
		try {
			String query = "UPDATE Dispatcher SET CourierServiceID=?, UserID=?, FirstName=?, LastName=?, ContactNumber=?, Address=?, Birthdate=? WHERE DispatcherID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, dispatcher.getCourierServiceID() );
			preparedStatement.setInt( 2, dispatcher.getUserID() );
			preparedStatement.setString( 3, dispatcher.getFirstName() );
			preparedStatement.setString( 4, dispatcher.getLastName() );
			preparedStatement.setInt( 5, dispatcher.getContactNumber() );
			preparedStatement.setString( 6, dispatcher.getAddress() );
			preparedStatement.setDate( 7, dispatcher.getBirthdate() );
			preparedStatement.setInt( 8, dispatcher.getDispatcherID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Dispatcher> getAllDispatchers() {
		List<Dispatcher> dispatchers = new ArrayList<Dispatcher>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Dispatcher" );
			while( resultSet.next() ) {
				Dispatcher dispatcher = new Dispatcher();
				dispatcher.setDispatcherID( resultSet.getInt( "DispatcherId" ) );
				dispatcher.setCourierServiceID( resultSet.getInt( "CourierServiceID" ) );
				dispatcher.setUserID( resultSet.getInt( "UserID" ) );
				dispatcher.setFirstName( resultSet.getString( "FirstName" ) );
				dispatcher.setLastName( resultSet.getString( "LastName" ) );
				dispatcher.setContactNumber( resultSet.getInt( "ContactNumber" ) );
				dispatcher.setAddress( resultSet.getString( "Address" ) );
				dispatcher.setBirthdate( resultSet.getDate( "Birthdate") );
				dispatchers.add(dispatcher);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dispatchers;
	}

	@Override
	public Dispatcher getDispatcherById(int dispatcherId) {
		Dispatcher dispatcher = new Dispatcher();
		try {
			String query = "SELECT * FROM Dispatcher WHERE DispatcherID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, dispatcherId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				dispatcher.setDispatcherID( resultSet.getInt( "DispatcherId" ) );
				dispatcher.setCourierServiceID( resultSet.getInt( "CourierServiceID" ) );
				dispatcher.setUserID( resultSet.getInt( "UserID" ) );
				dispatcher.setFirstName( resultSet.getString( "FirstName" ) );
				dispatcher.setLastName( resultSet.getString( "LastName" ) );
				dispatcher.setContactNumber( resultSet.getInt( "ContactNumber" ) );
				dispatcher.setAddress( resultSet.getString( "Address" ) );
				dispatcher.setBirthdate( resultSet.getDate( "Birthdate") );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dispatcher;
	}

}
