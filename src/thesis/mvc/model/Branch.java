package thesis.mvc.model;

public class Branch {
	
	private int BranchID;
	private String BranchStreet;
	private String BranchBarangay;
	private int CityID;
	private String BranchProvince;
	private String BranchLandline;
	private String BranchCellular;
	private String BranchOwner;
	private int PharmacyID;
	private boolean BranchAvailable;
	
	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
	}
	public String getBranchStreet() {
		return BranchStreet;
	}
	public void setBranchStreet(String branchStreet) {
		BranchStreet = branchStreet;
	}
	public String getBranchBarangay() {
		return BranchBarangay;
	}
	public void setBranchBarangay(String branchBarangay) {
		BranchBarangay = branchBarangay;
	}
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public String getBranchProvince() {
		return BranchProvince;
	}
	public void setBranchProvince(String branchProvince) {
		BranchProvince = branchProvince;
	}
	public String getBranchLandline() {
		return BranchLandline;
	}
	public void setBranchLandline(String branchLandline) {
		BranchLandline = branchLandline;
	}
	public String getBranchCellular() {
		return BranchCellular;
	}
	public void setBranchCellular(String branchCellular) {
		BranchCellular = branchCellular;
	}
	public String getBranchOwner() {
		return BranchOwner;
	}
	public void setBranchOwner(String branchOwner) {
		BranchOwner = branchOwner;
	}
	public int getPharmacyID() {
		return PharmacyID;
	}
	public void setPharmacyID(int pharmacyID) {
		PharmacyID = pharmacyID;
	}
	public boolean getBranchAvailable() {
		return BranchAvailable;
	}
	public void setBranchAvailable(boolean branchAvailable) {
		BranchAvailable = branchAvailable;
	}
}
