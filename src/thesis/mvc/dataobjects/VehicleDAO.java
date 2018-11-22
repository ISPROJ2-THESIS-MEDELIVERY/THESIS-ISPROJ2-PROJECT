package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Vehicle;

public interface VehicleDAO {

	public void addVehicle ( Vehicle vehicle );
	public void deleteVehicle ( String VehiclePlateNumber );
	public List<Vehicle> getVehicles(); 
	public Vehicle getVehiclebyPlate( String VehiclePlateNumber );
}
