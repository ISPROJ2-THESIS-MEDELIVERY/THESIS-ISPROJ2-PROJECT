package thesis.mvc.model;

import java.sql.Date;

public class Audit {

	private int AuditID;
	private int UserID;
	private String LogType;
	private Date Timestamp;
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
	public Date getTimestamp() {
		return Timestamp;
	}
	public void setTimestamp(Date timestamp) {
		Timestamp = timestamp;
	}
	public String getActionTaken() {
		return ActionTaken;
	}
	public void setActionTaken(String actionTaken) {
		ActionTaken = actionTaken;
	}

}
