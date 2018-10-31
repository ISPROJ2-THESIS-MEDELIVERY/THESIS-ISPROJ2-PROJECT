package thesis.mvc.model;

public class Driver {
	
	private int DriverID;
	private String DriverName;
	private String DriverAddress;
	private String DriverContactNumber;
	private int CourierserviceID;
	private boolean InTransit;
	
	public int getDriverID() {
		return DriverID;
	}
	public void setDriverID(int driverID) {
		DriverID = driverID;
	}
	public String getDriverName() {
		return DriverName;
	}
	public void setDriverName(String driverName) {
		DriverName = driverName;
	}
	public String getDriverAddress() {
		return DriverAddress;
	}
	public void setDriverAddress(String driverAddress) {
		DriverAddress = driverAddress;
	}
	public String getDriverContactNumber() {
		return DriverContactNumber;
	}
	public void setDriverContactNumber(String driverContactNumber) {
		DriverContactNumber = driverContactNumber;
	}
	public int getCourierserviceID() {
		return CourierserviceID;
	}
	public void setCourierserviceID(int courierserviceID) {
		CourierserviceID = courierserviceID;
	}
	public boolean isInTransit() {
		return InTransit;
	}
	public void setInTransit(boolean inTransit) {
		InTransit = inTransit;
	}
	
}
