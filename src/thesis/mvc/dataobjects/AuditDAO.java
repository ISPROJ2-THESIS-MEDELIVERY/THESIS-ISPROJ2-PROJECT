package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Audit;

public interface AuditDAO {
	public int addAudit ( Audit audit );
	public List<Audit> getAllAudit();
	public Audit getAuditbyId ( int auditId );
}
