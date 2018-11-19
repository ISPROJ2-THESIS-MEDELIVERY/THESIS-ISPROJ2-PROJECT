package thesis.mvc.model;

public class Customer {
	
	private int CustomerID;
	private int UserID;
	private String CustomerName;
	private String CustomerStreet;
	private String CustomerBarangay;
	private int CityID;
	private String CustomerProvince;
	private String CustomerLandline;
	private String CustomerCellular;
	private String Email;
	private boolean IsSeniorCitizen;
	private String SeniorCitizenID;
	private String BirthCertificate;
	
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
	public String getCustomerStreet() {
		return CustomerStreet;
	}
	public void setCustomerStreet(String customerStreet) {
		CustomerStreet = customerStreet;
	}
	public String getCustomerBarangay() {
		return CustomerBarangay;
	}
	public void setCustomerBarangay(String customerBarangay) {
		CustomerBarangay = customerBarangay;
	}
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public String getCustomerProvince() {
		return CustomerProvince;
	}
	public void setCustomerProvince(String customerProvince) {
		CustomerProvince = customerProvince;
	}
	public String getCustomerLandline() {
		return CustomerLandline;
	}
	public void setCustomerLandline(String customerLandline) {
		CustomerLandline = customerLandline;
	}
	public String getCustomerCellular() {
		return CustomerCellular;
	}
	public void setCustomerCellular(String customerCellular) {
		CustomerCellular = customerCellular;
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
	public String getBirthCertificate() {
		return BirthCertificate;
	}
	public void setBirthCertificate(String birthCertificate) {
		BirthCertificate = birthCertificate;
	}
	
}
