package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.PharmacistDAO;
import thesis.mvc.model.Pharmacist;
import thesis.mvc.utility.DBUtility;

public class PharmacistImplement implements PharmacistDAO{
	
	private Connection conn;

	public PharmacistImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addPharmacist(Pharmacist pharmacist) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, pharmacist.getUserID() );
			preparedStatement.setInt( 2, pharmacist.getBranchID() );
			preparedStatement.setString( 3, pharmacist.getFirstName() );
			preparedStatement.setString( 4, pharmacist.getLastName() );
			preparedStatement.setInt( 5, pharmacist.getPRCNo() );
			preparedStatement.setString( 6, pharmacist.getPosition() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletePharmacist(int pharmacistId) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, pharmacistId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updatePharmacist(Pharmacist pharmacist) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, pharmacist.getUserID() );
			preparedStatement.setInt( 2, pharmacist.getBranchID() );
			preparedStatement.setString( 3, pharmacist.getFirstName() );
			preparedStatement.setString( 4, pharmacist.getLastName() );
			preparedStatement.setInt( 5, pharmacist.getPRCNo() );
			preparedStatement.setString( 6, pharmacist.getPosition() );
			preparedStatement.setInt( 7, pharmacist.getPharmacistID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Pharmacist> getAllPharmacists() {
		List<Pharmacist> pharmacists = new ArrayList<Pharmacist>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "" );
			while( resultSet.next() ) {
				Pharmacist pharmacist = new Pharmacist();
				pharmacist.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				pharmacist.setUserID( resultSet.getInt( "UserID" ) );
				pharmacist.setBranchID( resultSet.getInt( "BranchID" ) );
				pharmacist.setFirstName( resultSet.getString( "FirstName" ) );
				pharmacist.setLastName( resultSet.getString( "LastName" ) );
				pharmacist.setPRCNo( resultSet.getInt( "PRCNo" ) );
				pharmacist.setPosition( resultSet.getString( "Position" ) );
				pharmacists.add(pharmacist);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmacists;
	}

	@Override
	public Pharmacist getPharmacistById(int pharmacistId) {
		Pharmacist pharmacist = new Pharmacist();
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, pharmacistId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				pharmacist.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				pharmacist.setUserID( resultSet.getInt( "UserID" ) );
				pharmacist.setBranchID( resultSet.getInt( "BranchID" ) );
				pharmacist.setFirstName( resultSet.getString( "FirstName" ) );
				pharmacist.setLastName( resultSet.getString( "LastName" ) );
				pharmacist.setPRCNo( resultSet.getInt( "PRCNo" ) );
				pharmacist.setPosition( resultSet.getString( "Position" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmacist;
	}

}
