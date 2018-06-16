package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Admin;

public interface AdminDAO {
	public int addAdmin( Admin admin );
	public void deleteAdmin( int adminId );
	public void UpdateAdmin( Admin admin ); 
	public List<Admin> getAllAdmins();
	public Admin getAdminById( int adminId );
}
