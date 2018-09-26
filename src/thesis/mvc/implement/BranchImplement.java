package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.BranchDAO;
import thesis.mvc.model.Branch;
import thesis.mvc.utility.DBUtility;

public class BranchImplement implements BranchDAO{
	
	private Connection conn;

	public BranchImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addBranch(Branch branch) {
		try {
			String query = "INSERT INTO Branch (BranchStreet, BranchBarangay, CityID, BranchProvince, BranchLandline, BranchCellular, BranchOwner, PharmacyID, BranchAvailable) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, branch.getBranchStreet() );
			preparedStatement.setString( 2, branch.getBranchBarangay() );
			preparedStatement.setInt( 3, branch.getCityID() );
			preparedStatement.setString( 4, branch.getBranchProvince() );
			preparedStatement.setString( 5, branch.getBranchLandline() );
			preparedStatement.setString( 6, branch.getBranchCellular() );
			preparedStatement.setString( 7, branch.getBranchOwner() );
			preparedStatement.setInt( 8, branch.getPharmacyID() );
			preparedStatement.setBoolean( 9, branch.getBranchAvailable() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
		
	}

	@Override
	public void deleteBranch(int branchId) {
		try {
			String query = "DELETE FROM Branch where BranchID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, branchId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateBranch(Branch branch) {
		try {
			String query = "UPDATE Branch SET BranchStreet=?, BranchBarangay=?, CityID=?, BranchProvince=?, BranchLandline=?, BranchCellular=?, BranchOwner=?, PharmacyID=?, BranchAvailable=? WHERE BranchID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, branch.getBranchStreet() );
			preparedStatement.setString( 2, branch.getBranchBarangay() );
			preparedStatement.setInt( 3, branch.getCityID() );
			preparedStatement.setString( 4, branch.getBranchProvince() );
			preparedStatement.setString( 5, branch.getBranchLandline() );
			preparedStatement.setString( 6, branch.getBranchCellular() );
			preparedStatement.setString( 7, branch.getBranchOwner() );
			preparedStatement.setInt( 8, branch.getPharmacyID() );
			preparedStatement.setBoolean( 9, branch.getBranchAvailable() );
			preparedStatement.setInt( 10, branch.getBranchID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Branch> getAllBranch() {
		List<Branch> branches = new ArrayList<Branch>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Branch" );
			while( resultSet.next() ) {
				Branch branch = new Branch();
				branch.setBranchID( resultSet.getInt( "BranchID" ) );
				branch.setBranchStreet( resultSet.getString( "BranchStreet" ) );
				branch.setBranchBarangay( resultSet.getString( "BranchBarangay" ) );
				branch.setCityID( resultSet.getInt( "CityID" ) );
				branch.setBranchProvince( resultSet.getString( "BranchProvince" ) );
				branch.setBranchLandline( resultSet.getString( "BranchLandline" ) );
				branch.setBranchCellular( resultSet.getString( "BranchCellular" ) );
				branch.setBranchOwner( resultSet.getString( "BranchOwner" ) );
				branch.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
				branch.setBranchAvailable( resultSet.getBoolean( "BranchAvailable" ) );
				branches.add(branch);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return branches;
	}

	@Override
	public Branch getBranchById(int branchId) {
		Branch branch = new Branch();
		try {
			String query = "SELECT * FROM Branch WHERE BranchID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, branchId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				branch.setBranchID( resultSet.getInt( "BranchID" ) );
				branch.setBranchStreet( resultSet.getString( "BranchStreet" ) );
				branch.setBranchBarangay( resultSet.getString( "BranchBarangay" ) );
				branch.setCityID( resultSet.getInt( "CityID" ) );
				branch.setBranchProvince( resultSet.getString( "BranchProvince" ) );
				branch.setBranchLandline( resultSet.getString( "BranchLandline" ) );
				branch.setBranchCellular( resultSet.getString( "BranchCellular" ) );
				branch.setBranchOwner( resultSet.getString( "BranchOwner" ) );
				branch.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
				branch.setBranchAvailable( resultSet.getBoolean( "BranchAvailable" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return branch;
	}

	public Branch getBranchByPharmacy(int pharmacyID) {
		Branch branch = new Branch();
		try {
			String query = "SELECT * FROM Branch WHERE PharmacyID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, pharmacyID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				branch.setBranchID( resultSet.getInt( "BranchID" ) );
				branch.setBranchStreet( resultSet.getString( "BranchStreet" ) );
				branch.setBranchBarangay( resultSet.getString( "BranchBarangay" ) );
				branch.setCityID( resultSet.getInt( "CityID" ) );
				branch.setBranchProvince( resultSet.getString( "BranchProvince" ) );
				branch.setBranchLandline( resultSet.getString( "BranchLandline" ) );
				branch.setBranchCellular( resultSet.getString( "BranchCellular" ) );
				branch.setBranchOwner( resultSet.getString( "BranchOwner" ) );
				branch.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
				branch.setBranchAvailable( resultSet.getBoolean( "BranchAvailable" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return branch;
	}
}
