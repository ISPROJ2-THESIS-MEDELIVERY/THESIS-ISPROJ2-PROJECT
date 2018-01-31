package thesis.mvc.model;

public class Delivery {
	private int DeliveryID;
	private int DispatcherID;
	private int DriverID;
	private String PlateNumber;
	private String Comments;
	public int getDeliveryID() {
		return DeliveryID;
	}
	public void setDeliveryID(int deliveryID) {
		DeliveryID = deliveryID;
	}
	public int getDispatcherID() {
		return DispatcherID;
	}
	public void setDispatcherID(int dispatcherID) {
		DispatcherID = dispatcherID;
	}
	public int getDriverID() {
		return DriverID;
	}
	public void setDriverID(int driverID) {
		DriverID = driverID;
	}
	public String getPlateNumber() {
		return PlateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		PlateNumber = plateNumber;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}

}
