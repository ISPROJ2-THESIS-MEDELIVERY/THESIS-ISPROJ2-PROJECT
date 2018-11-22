package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.VehicleDAO;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Vehicle;
import thesis.mvc.utility.DBUtility;

public class VehicleImplement implements VehicleDAO {
	
	private Connection conn;

	public VehicleImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addVehicle(Vehicle vehicle) {
		try (PreparedStatement stmt = conn.prepareStatement( "INSERT INTO `Vehicle`(`PlateNumber`, `CourierServiceID`, `VehicleModel`) VALUES (?,?,?)" );){
			stmt.setString( 1, vehicle.getPlateNumber() );
			stmt.setInt( 2, vehicle.getCourierServiceID() );
			stmt.setString( 3, vehicle.getVehicleModel() );
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteVehicle(String VehiclePlateNumber) {
		try {
			String query = "DELETE FROM `Vehicle` where PlateNumber=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString(1, VehiclePlateNumber);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Vehicle> getVehicles() {
		List<Vehicle> vehicles = new ArrayList<Vehicle>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM `Vehicle`" );
			while( resultSet.next() ) {
				Vehicle vehicle = new Vehicle();
				vehicle.setPlateNumber(resultSet.getString(1));
				vehicle.setCourierServiceID(resultSet.getInt(2));
				vehicle.setVehicleModel(resultSet.getString(3));
				vehicles.add(vehicle);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vehicles;
	}

	@Override
	public Vehicle getVehiclebyPlate(String VehiclePlateNumber) {
		Vehicle vehicle = new Vehicle();
		try {
			String query = "SELECT * FROM `Vehicle` WHERE PlateNumber=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString(1, VehiclePlateNumber);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				vehicle.setPlateNumber(resultSet.getString(1));
				vehicle.setCourierServiceID(resultSet.getInt(2));
				vehicle.setVehicleModel(resultSet.getString(3));
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vehicle;
	}

}
