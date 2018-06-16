package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Login;

public interface LoginDAO {
	public int addLogin( Login login );
	public void deleteLogin( int loginId );
	public void updateLogin( Login login );
	public List<Login> getAllLogins();
	public Login getLoginByID( int loginId );

}
