package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Driver;

public interface DriverDAO {
	public void addDriver ( Driver driver );
	public void deleteDriver ( int driverId );
	public void updateDriver ( Driver driver );
	public List<Driver> getAllDrivers();
	public Driver getDriverById ( int driverId );
}
