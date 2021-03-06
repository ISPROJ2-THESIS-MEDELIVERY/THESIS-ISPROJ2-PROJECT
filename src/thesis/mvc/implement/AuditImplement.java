package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.AuditDAO;
import thesis.mvc.model.Audit;
import thesis.mvc.utility.DBUtility;

public class AuditImplement implements AuditDAO{
	
	private Connection conn;

	public AuditImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addAudit(Audit audit) {
		try (PreparedStatement stmt = conn.prepareStatement( "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)" );){
			stmt.setInt( 1, audit.getUserID() );
			stmt.setString( 2, audit.getLogType() );
			stmt.setDate( 3, audit.getTimestamp() );
			stmt.setString( 4, audit.getActionTaken() );
			int NewID = stmt.executeUpdate();
			stmt.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public List<Audit> getAllAudit() {	
	List<Audit> audits = new ArrayList<Audit>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Audit" );
			while( resultSet.next() ) {
				Audit audit = new Audit();
				audit.setAuditID( resultSet.getInt( "AuditID" ) );
				audit.setUserID( resultSet.getInt( "UserID" ) );
				audit.setLogType( resultSet.getString( "LogType" ) );
				audit.setTimestamp( resultSet.getDate( "Timestamp" ) );
				audit.setActionTaken( resultSet.getString( "ActionTaken" ) );
				audits.add(audit);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return audits;
	}

	@Override
	public Audit getAuditbyId(int auditId) {Audit audit = new Audit();
		try {
			String query = "SELECT * FROM Audit WHERE AuditID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, auditId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				audit.setAuditID( resultSet.getInt( "AuditID" ) );
				audit.setUserID( resultSet.getInt( "UserID" ) );
				audit.setLogType( resultSet.getString( "LogType" ) );
				audit.setTimestamp( resultSet.getDate( "Timestamp" ) );
				audit.setActionTaken( resultSet.getString( "ActionTaken" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return audit;
	}
	

}
