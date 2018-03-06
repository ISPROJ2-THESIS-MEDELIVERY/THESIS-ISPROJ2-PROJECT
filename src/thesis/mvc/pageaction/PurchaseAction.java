package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import thesis.mvc.dataobjects.OrderDetailDAO;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

public class PurchaseAction {
	
	private Connection conn;

	public PurchaseAction() {
		conn = DBUtility.getConnection();
	}
	
	public boolean purchaseOrder(Order order, List<OrderDetail> OrderDetails, Product product) {
		OrderDetails.size();
		
		if (OrderDetails.size() > 5) {
			return false;
		}
		
		for(int q = 0; q <= 5; q++) {  
			OrderDetail orderDetail = OrderDetails.get(q);
			if (orderDetail.getQuantity() > 5) {
				return false;
			}
		}
		
		boolean rx = product.isRXProduct();
		
		if(rx) {
			return false;
		}
		
			
		/*PreparedStatement ps1 = conn.prepareStatement("update t1 set a2=? where id=1");
        Blob blob = conn.createBlob();
        blob.setBytes(1, str.getBytes());
        ps1.setBlob(1, blob);
        ps1.executeUpdate();*/
		
		int CityCustomer = 0;
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, order.getCustomerID());
            try(ResultSet rs = stmt.executeQuery()) {
            	CityCustomer = rs.getInt("CityID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
		//Get the Pharmacist
		int PharmaID = 0;
		
		//What branch ID does the pharmacist come from
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM pharmacist WHERE PharmacistID = ?")) {
			stmt.setInt(1, order.getPharmacistID());
			try(ResultSet rs = stmt.executeQuery()) {
				PharmaID = rs.getInt("BranchID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		//Where is the branch located.
		int CityPharmacy = -1;
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM branch WHERE BranchID = ?")) {
			stmt.setInt(1, PharmaID);
			try(ResultSet rs = stmt.executeQuery()){
				CityPharmacy = rs.getInt("CityID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		
		int DeliveryCharge = 0;
		
		if (CityCustomer == CityPharmacy) {
			DeliveryCharge = 50;
		} else {
			DeliveryCharge = 100;
		}
		return true;
		
		
		
		
	
	}
}
