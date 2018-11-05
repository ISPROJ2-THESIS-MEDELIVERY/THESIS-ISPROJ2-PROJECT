package thesis.mvc.model;

import java.sql.Date;

public class Audit {

	private int AuditID;
	private int UserID;
	private String LogType;
	private java.sql.Timestamp Timestamp;
	private String ActionTaken;
	
	public int getAuditID() {
		return AuditID;
	}
	public void setAuditID(int auditID) {
		AuditID = auditID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getLogType() {
		return LogType;
	}
	public void setLogType(String logType) {
		LogType = logType;
	}
	public java.sql.Timestamp getTimestamp() {
		return Timestamp;
	}
	public void setTimestamp(java.sql.Timestamp timestamp) {
		Timestamp = timestamp;
	}
	public String getActionTaken() {
		return ActionTaken;
	}
	public void setActionTaken(String actionTaken) {
		ActionTaken = actionTaken;
	}

}
