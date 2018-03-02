package thesis.mvc.utility;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean
@SessionScoped
public class UniversalBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int loggedInId = 0;
    private String loggedInUsername = "None";

    public int getLoggedInId() {
        return loggedInId;
    }

    public void setLoggedInId(int loggedInId) { this.loggedInId = loggedInId; }

    public String getLoggedInUsername() {
        return loggedInUsername;
    }

    public void setLoggedInUsername(String loggedInUsername) {
        this.loggedInUsername = loggedInUsername;
    }

}
