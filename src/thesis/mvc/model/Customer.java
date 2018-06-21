package thesis.mvc.model;

public class Customer {
	
	private int CustomerID;
	private int UserID;
	private String CustomerName;
	private String Address;
	private int CityID;
	private String Email;
	private boolean IsSeniorCitizen;
	private String SeniorCitizenID;
	private int ContactNumber;
	
	public int getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getCustomerName() {
		return CustomerName;
	}
	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public boolean isIsSeniorCitizen() {
		return IsSeniorCitizen;
	}
	public void setIsSeniorCitizen(boolean isSeniorCitizen) {
		IsSeniorCitizen = isSeniorCitizen;
	}
	public String getSeniorCitizenID() {
		return SeniorCitizenID;
	}
	public void setSeniorCitizenID(String seniorCitizenID) {
		SeniorCitizenID = seniorCitizenID;
	}
	public int getContactNumber() {
		return ContactNumber;
	}
	public void setContactNumber(int contactNumber) {
		ContactNumber = contactNumber;
	}
	
	

}
