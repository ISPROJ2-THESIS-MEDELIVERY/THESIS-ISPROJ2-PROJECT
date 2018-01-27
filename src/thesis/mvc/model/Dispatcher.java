package thesis.mvc.model;

import java.sql.Date;

public class Dispatcher {

	private int DispatcherID;
	private int CourierServiceID;
	private int UserID;
	private String FirstName;
	private String LastName;
	private int ContactNumber;
	private String Address;
	private Date Birthdate;
	public int getDispatcherID() {
		return DispatcherID;
	}
	public void setDispatcherID(int dispatcherID) {
		DispatcherID = dispatcherID;
	}
	public int getCourierServiceID() {
		return CourierServiceID;
	}
	public void setCourierServiceID(int courierServiceID) {
		CourierServiceID = courierServiceID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public int getContactNumber() {
		return ContactNumber;
	}
	public void setContactNumber(int contactNumber) {
		ContactNumber = contactNumber;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Date getBirthdate() {
		return Birthdate;
	}
	public void setBirthdate(Date birthdate) {
		Birthdate = birthdate;
	}

	
}
