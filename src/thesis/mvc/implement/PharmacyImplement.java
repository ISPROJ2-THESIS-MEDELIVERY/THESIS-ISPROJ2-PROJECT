package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.PharmacyDAO;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.utility.DBUtility;

public class PharmacyImplement implements PharmacyDAO{
	
	private Connection conn;

	public PharmacyImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addPharmacy(Pharmacy pharmacy) {
		try {
			String query = "INSERT INTO pharmacy (PharmacyName, PharmacyLogo) VALUES (?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, pharmacy.getPharmacyName() );
			preparedStatement.setString( 2, pharmacy.getPharmacyLogo() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
	}

	@Override
	public void deletePharmacy(int pharmacyId) {
		try {
			String query = "DELETE FROM pharmacy where PharmacyID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, pharmacyId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void UpdatePharmacy(Pharmacy pharmacy) {
		try {
			String query = "UPDATE Pharmacy SET UserID=?, BranchID=? WHERE PharmacyID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, pharmacy.getPharmacyName() );
			preparedStatement.setString( 2, pharmacy.getPharmacyLogo() );
			preparedStatement.setInt( 3, pharmacy.getPharmacyID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Pharmacy> getAllPharmacys() {
		List<Pharmacy> pharmacys = new ArrayList<Pharmacy>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Pharmacy" );
			while( resultSet.next() ) {
				Pharmacy pharmacy = new Pharmacy();
				pharmacy.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
				pharmacy.setPharmacyName( resultSet.getString( "PharmacyName" ) );
				pharmacy.setPharmacyLogo( resultSet.getString( "PharmacyLogo" ) );
				pharmacys.add(pharmacy);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmacys;
	}

	@Override
	public Pharmacy getPharmacyById(int pharmacyId) {
		Pharmacy pharmacy = new Pharmacy();
		try {
			String query = "SELECT * FROM Pharmacy WHERE PharmacyID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, pharmacyId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				pharmacy.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
				pharmacy.setPharmacyName( resultSet.getString( "PharmacyName" ) );
				pharmacy.setPharmacyLogo( resultSet.getString( "PharmacyLogo" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmacy;
	}


}
