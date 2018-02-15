package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.PrescriptionDAO;
import thesis.mvc.model.Prescription;
import thesis.mvc.utility.DBUtility;

public class PrescriptionImplement implements PrescriptionDAO {
	
	private Connection conn;

	public PrescriptionImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addPrescription(Prescription prescription) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, prescription.getPharmacistID() );
			preparedStatement.setInt( 2, prescription.getCustomerID() );
			preparedStatement.setString( 3, prescription.getPermissionStatus() );
			preparedStatement.setString( 4, prescription.getRemark() );
			preparedStatement.setString( 5, prescription.getPrescription() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updatePrescription(int prescriptionId) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, prescriptionId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletePrescription(Prescription prescription) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, prescription.getPharmacistID() );
			preparedStatement.setInt( 2, prescription.getCustomerID() );
			preparedStatement.setString( 3, prescription.getPermissionStatus() );
			preparedStatement.setString( 4, prescription.getRemark() );
			preparedStatement.setString( 5, prescription.getPrescription() );
			preparedStatement.setInt( 6, prescription.getPrescriptionID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Prescription> getAllPrescription() {
		List<Prescription> prescriptions = new ArrayList<Prescription>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "" );
			while( resultSet.next() ) {
				Prescription prescription = new Prescription();
				prescription.setPrescriptionID( resultSet.getInt( "PrescriptionID" ) );
				prescription.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				prescription.setCustomerID( resultSet.getInt( "CustomerID" ) );
				prescription.setPermissionStatus( resultSet.getString( "PermissionStatus" ) );
				prescription.setRemark( resultSet.getString( "Remark" ) );
				prescription.setPrescription( resultSet.getString( "Prescription" ) );
				prescriptions.add(prescription);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prescriptions;
	}

	@Override
	public Prescription getPrescriptionByID(int prescriptionId) {
		Prescription prescription = new Prescription();
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, prescriptionId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				prescription.setPrescriptionID( resultSet.getInt( "PrescriptionID" ) );
				prescription.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
				prescription.setCustomerID( resultSet.getInt( "CustomerID" ) );
				prescription.setPermissionStatus( resultSet.getString( "PermissionStatus" ) );
				prescription.setRemark( resultSet.getString( "Remark" ) );
				prescription.setPrescription( resultSet.getString( "Prescription" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prescription;
	}

}
