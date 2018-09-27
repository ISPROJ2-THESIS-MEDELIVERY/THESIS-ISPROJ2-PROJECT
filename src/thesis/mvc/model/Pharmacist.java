package thesis.mvc.model;

public class Pharmacist {
	
	private int PharmacistID;
	private int UserID;
	private int BranchID;
	private String FirstName;
	private String LastName;
	private String PRCNo;
	private String Position;
	public int getPharmacistID() {
		return PharmacistID;
	}
	public void setPharmacistID(int pharmacistID) {
		PharmacistID = pharmacistID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
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
	public String getPRCNo() {
		return PRCNo;
	}
	public void setPRCNo(String pRCNo) {
		PRCNo = pRCNo;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}

}
