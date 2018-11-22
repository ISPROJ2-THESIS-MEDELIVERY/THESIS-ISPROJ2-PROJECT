package thesis.mvc.model;

public class Vehicle {
	
	private String PlateNumber;
	private int CourierServiceID;
	private String VehicleModel;
	
	
	public String getPlateNumber() {
		return PlateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		PlateNumber = plateNumber;
	}
	public int getCourierServiceID() {
		return CourierServiceID;
	}
	public void setCourierServiceID(int courierServiceID) {
		CourierServiceID = courierServiceID;
	}
	public String getVehicleModel() {
		return VehicleModel;
	}
	public void setVehicleModel(String vehicleModel) {
		VehicleModel = vehicleModel;
	}
	
}
