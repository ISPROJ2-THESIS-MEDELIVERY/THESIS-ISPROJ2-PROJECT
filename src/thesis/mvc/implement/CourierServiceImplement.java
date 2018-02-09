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

import thesis.mvc.dataobjects.CourierServiceDAO;
import thesis.mvc.model.CourierService;
import thesis.mvc.utility.DBUtility;

public class CourierServiceImplement implements CourierServiceDAO{
	
	private Connection conn;

	public CourierServiceImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addCourierService(CourierService courierService) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, courierService.getCompanyName() );
			preparedStatement.setString( 2, courierService.getCompanyStreet() );
			preparedStatement.setString( 3, courierService.getCompanyBarangay() );
			preparedStatement.setString( 4, courierService.getCompanyCity() );
			preparedStatement.setString( 5, courierService.getCompanyProvince() );
			preparedStatement.setInt( 6, courierService.getCompanyLandline() );
			preparedStatement.setInt( 7, courierService.getCompanyCellular() );
			preparedStatement.setString( 8, courierService.getCompanyContact() );
			preparedStatement.setDate( 9, CurrentDate );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteCourierService(int courierServiceId) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, courierServiceId );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateCourierService(CourierService courierService) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, courierService.getCompanyName() );
			preparedStatement.setString( 2, courierService.getCompanyStreet() );
			preparedStatement.setString( 3, courierService.getCompanyBarangay() );
			preparedStatement.setString( 4, courierService.getCompanyCity() );
			preparedStatement.setString( 5, courierService.getCompanyProvince() );
			preparedStatement.setInt( 6, courierService.getCompanyLandline() );
			preparedStatement.setInt( 7, courierService.getCompanyCellular() );
			preparedStatement.setString( 8, courierService.getCompanyContact() );
			preparedStatement.setDate( 9, courierService.getDateAdded() );
			preparedStatement.setInt( 10, courierService.getCourierServiceID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<CourierService> getAllCourierService() {
		List<CourierService> courierServices = new ArrayList<CourierService>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "" );
			while( resultSet.next() ) {
				CourierService courierService = new CourierService();
				courierService.setCourierServiceID( resultSet.getInt( "CourierServiceID" ) );
				courierService.setCompanyName( resultSet.getString( "CompanyName" ) );
				courierService.setCompanyStreet( resultSet.getString( "CompanyStreet" ) );
				courierService.setCompanyBarangay( resultSet.getString( "CompanyBarangay" ) );
				courierService.setCompanyCity( resultSet.getString( "CompanyCity" ) );
				courierService.setCompanyProvince( resultSet.getString( "CompanyProvince" ) );
				courierService.setCompanyLandline( resultSet.getInt( "CompanyLandline" ) );
				courierService.setCompanyCellular( resultSet.getInt( "CompanyCellular" ) );
				courierService.setCompanyContact( resultSet.getString( "CompanyContact" ) );
				courierService.setDateAdded( resultSet.getDate( "DateAdded" ) );
				courierServices.add(courierService);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courierServices;
	}

	@Override
	public CourierService getCourierServiceById(int courierServiceId) {
		CourierService courierService = new CourierService();
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, courierServiceId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				courierService.setCourierServiceID( resultSet.getInt( "CourierServiceID" ) );
				courierService.setCompanyName( resultSet.getString( "CompanyName" ) );
				courierService.setCompanyStreet( resultSet.getString( "CompanyStreet" ) );
				courierService.setCompanyBarangay( resultSet.getString( "CompanyBarangay" ) );
				courierService.setCompanyCity( resultSet.getString( "CompanyCity" ) );
				courierService.setCompanyProvince( resultSet.getString( "CompanyProvince" ) );
				courierService.setCompanyLandline( resultSet.getInt( "CompanyLandline" ) );
				courierService.setCompanyCellular( resultSet.getInt( "CompanyCellular" ) );
				courierService.setCompanyContact( resultSet.getString( "CompanyContact" ) );
				courierService.setDateAdded( resultSet.getDate( "DateAdded" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courierService;
	}

}
