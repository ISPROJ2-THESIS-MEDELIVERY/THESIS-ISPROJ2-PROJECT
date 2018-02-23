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
			String query = "INSERT INTO Prescription (PharmacistID, CustomerID, PermissionStatus, Remark, Prescription) VALUES (?,?,?,?,?)";
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
		} try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, 3 ); //3 is a placeholder
			preparedStatement.setString( 2, "create, update or delete" ); //placeholder
			preparedStatement.setDate( 3, CurrentDate );
			preparedStatement.setString( 4, "User with ID " + prescription.getPharmacistID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletePrescription(int prescriptionId) {
		try {
			String query = "DELETE FROM Prescription where PrescriptionID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, prescriptionId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updatePrescription(Prescription prescription) {
		try {
			String query = "UPDATE Prescription SET PharmacistID=?, CustomerID=?, PermissionStatus=?, Remark=?, Prescription=? WHERE PrescriptionID=?";
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
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Prescription" );
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
			String query = "SELECT * FROM Prescription WHERE PrescriptionID=?";
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
