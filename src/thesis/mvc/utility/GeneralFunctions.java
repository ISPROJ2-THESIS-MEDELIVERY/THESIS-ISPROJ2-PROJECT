package thesis.mvc.utility;

import java.sql.Date;
import java.util.Calendar;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.model.Audit;

public class GeneralFunctions {
	public static boolean isInteger(String s) {
	    try { 
	        Integer.parseInt(s); 
	    } catch(NumberFormatException e) { 
	        return false; 
	    } catch(NullPointerException e) {
	        return false;
	    }
	    // only got here if we didn't return false
	    return true;
	}
	
	@SuppressWarnings("null")
	public static boolean autoAudit(int UID, String Type, String Action) {
		try {
			Audit audit = null;
			audit.setUserID(UID);
			audit.setLogType(Type);
			audit.setTimestamp(new Date(Calendar.getInstance().getTime().getTime()));
			audit.setActionTaken(Action);
			AuditImplement auditImplement = new AuditImplement();
			auditImplement.addAudit(audit);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}