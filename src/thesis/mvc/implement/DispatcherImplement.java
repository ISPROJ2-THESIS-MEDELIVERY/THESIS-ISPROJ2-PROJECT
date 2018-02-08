package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.AdminDAO;
import thesis.mvc.dataobjects.DispatcherDAO;
import thesis.mvc.model.Admin;
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
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, dispatcher.getDispatcherID() );
			preparedStatement.setInt( 2, dispatcher.getCourierServiceID() );
			preparedStatement.setInt( 3, dispatcher.getUserID() );
			preparedStatement.setString( 4, dispatcher.getFirstName() );
			preparedStatement.setString( 5, dispatcher.getLastName() );
			preparedStatement.setInt( 6, dispatcher.getContactNumber() );
			preparedStatement.setString( 7, dispatcher.getAddress() );
			preparedStatement.setDate( 8, dispatcher.getBirthdate() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteDispatcher(int dispatcherId) {
		try {
			String query = "";
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
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, dispatcher.getDispatcherID() );
			preparedStatement.setInt( 2, dispatcher.getCourierServiceID() );
			preparedStatement.setInt( 3, dispatcher.getUserID() );
			preparedStatement.setString( 4, dispatcher.getFirstName() );
			preparedStatement.setString( 5, dispatcher.getLastName() );
			preparedStatement.setInt( 6, dispatcher.getContactNumber() );
			preparedStatement.setString( 7, dispatcher.getAddress() );
			preparedStatement.setDate( 8, dispatcher.getBirthdate() );
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
			ResultSet resultSet = statement.executeQuery( "" );
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
		// TODO Auto-generated method stub
		return null;
	}

}
