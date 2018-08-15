package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.PharmacyDAO;
import thesis.mvc.model.Pharmacist;
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
			String query = "INSERT INTO Pharmacy (PharmacyName, PharmacyLogo) VALUES (?,?)";
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
			String query = "DELETE FROM Pharmacy where PharmacistID=?";
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
			String query = "UPDATE Pharmacist SET UserID=?, BranchID=?, FirstName=?, LastName=?, PRCNo=? Position=?WHERE PharmacistID=?";
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
		List<Pharmacy> pharmicies = new ArrayList<Pharmacy>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Pharmacist" );
			while( resultSet.next() ) {
				Pharmacy pharmacy = new Pharmacy();
				pharmacy.setPharmacyLogo( resultSet.getString( "PharmacyLogo" ) );
				pharmacy.setPharmacyName( resultSet.getString( "PharmacyName" ) );
				pharmicies.add(pharmacy);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmicies;
	}

	@Override
	public Pharmacy getPharmacyById(int pharmacyId) {
		Pharmacy pharmacy = new Pharmacy();
		try {
			String query = "SELECT * FROM Pharmacist WHERE PharmacistID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, pharmacyId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				pharmacy.setPharmacyLogo( resultSet.getString( "PharmacyLogo" ) );
				pharmacy.setPharmacyName( resultSet.getString( "PharmacyName" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pharmacy;
	}

}
