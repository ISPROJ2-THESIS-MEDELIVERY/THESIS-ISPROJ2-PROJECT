package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.utility.DBUtility;

public class PurchaseController {
	
	private Connection conn;

	public PurchaseController() {
		conn = DBUtility.getConnection();
	}
	
	public void purchaseOrder(Order order, List<OrderDetail> OrderDetails, int UserID) {
		int Deliverycharge = 0;
		String CityCustomer = "";
		String CityPharmacy = "";
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM login WHERE Username = ?")) {
            stmt.setInt(1, UserID);
            try(ResultSet rs = stmt.executeQuery()) {
            	CityCustomer = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		//Add Code here first
		
		//Stop here
		if (CityCustomer == CityPharmacy) {
			Deliverycharge = 50;
		} else {
			Deliverycharge = 100;
		}
		
	
	}
}