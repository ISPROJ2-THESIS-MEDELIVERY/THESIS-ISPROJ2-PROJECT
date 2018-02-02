package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Driver;

public interface DriverDAO {
	public void addDriver ( Driver driver );
	public void updateDriver ( int driverId );
	public void deleteDriver ( Driver driver );
	public List<Driver> getAllDrivers();
	public Driver getDriverById ( int driverId );
}
