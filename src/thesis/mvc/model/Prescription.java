package thesis.mvc.model;

public class Prescription {
	
	private int PrescriptionID;
	private int PharmacistID;
	private int CustomerID;
	private String PermissionStatus;
	private String Remark;
	private String Prescription;
	
	public int getPrescriptionID() {
		return PrescriptionID;
	}
	public void setPrescriptionID(int prescriptionID) {
		PrescriptionID = prescriptionID;
	}
	public int getPharmacistID() {
		return PharmacistID;
	}
	public void setPharmacistID(int pharmacistID) {
		PharmacistID = pharmacistID;
	}
	public int getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
	public String getPermissionStatus() {
		return PermissionStatus;
	}
	public void setPermissionStatus(String permissionStatus) {
		PermissionStatus = permissionStatus;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getPrescription() {
		return Prescription;
	}
	public void setPrescription(String prescription) {
		Prescription = prescription;
	}

}
