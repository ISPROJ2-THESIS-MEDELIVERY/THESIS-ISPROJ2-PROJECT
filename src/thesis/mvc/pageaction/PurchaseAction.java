package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.utility.DBUtility;

public class PurchaseAction {
	
	private Connection conn;

	public PurchaseAction() {
		conn = DBUtility.getConnection();
	}
	
	public void purchaseOrder(Order order, List<OrderDetail> OrderDetails, int CustomerID, String BranchProvince) {
		int Deliverycharge = 0;
		int CityCustomer = -2;
		int CityPharmacy = -1;
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, CustomerID);
            try(ResultSet rs = stmt.executeQuery()) {
            	CityCustomer = rs.getInt("CityID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		//Get the Pharmacist
		int PharmaID = order.getPharmacistID();
		
		//What branch ID does the pharmacist come from
		
		//Where is the branch located.
		
		
		if (CityCustomer == CityPharmacy) {
			Deliverycharge = 50;
		} else {
			Deliverycharge = 100;
		}
		
	
	}
}
