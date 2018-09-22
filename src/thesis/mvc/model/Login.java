package thesis.mvc.model;

import java.sql.Date;

public class Login {
	
	private int UserID;
	private String Username;
	private String Password;
	private String LoginStatus;
	private Date LoginLast;
	private Date SignupDate;
	private int UsertypeID;
	
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getLoginStatus() {
		return LoginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		LoginStatus = loginStatus;
	}
	public Date getLoginLast() {
		return LoginLast;
	}
	public void setLoginLast(Date loginLast) {
		LoginLast = loginLast;
	}
	public Date getSignupDate() {
		return SignupDate;
	}
	public void setSignupDate(Date signupDate) {
		SignupDate = signupDate;
	}
	public int getUsertypeID() {
		return UsertypeID;
	}
	public void setUsertypeID(int usertypeID) {
		UsertypeID = usertypeID;
	}
	
	
}
