package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.utility.DBUtility;

public class PurchaseAction {
	
	private Connection conn;

	public PurchaseAction() {
		conn = DBUtility.getConnection();
	}
	
	public boolean purchaseOrder(Order order, List<OrderDetail> OrderDetails) {
		if (OrderDetails.size() > 5) {          //Check if order has less than 5 items
			return false;
		}
		
		for (OrderDetail orderDetail : OrderDetails) {             //Check if the quantity of each item in the order is less than the limit
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){  //Check if items in the order is RX
				int limit;
				stmt.setInt(1,  orderDetail.getProductID() );
				try(ResultSet rs = stmt.executeQuery()){
					limit = rs.getInt("CounterLimit");
				} if (orderDetail.getQuantity() > limit) {
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		for (OrderDetail orderDetail : OrderDetails) {
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){  //Check if items in the order is RX
				boolean rx = false;
				stmt.setInt(1,  orderDetail.getProductID() );
				try(ResultSet rs = stmt.executeQuery()){
					rx = rs.getBoolean("isRXProduct");
				} if (rx == true) {
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		
		/*boolean rx = product.isRXProduct();
		
		if(rx) {
			return false;
		}*/
		
		
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
		
		if (CityCustomer == CityPharmacy) {   //Check if city is equal or not
			DeliveryCharge = 50;
		} else {
			DeliveryCharge = 100;
		}
		
		OrderImplement OrderImp = new OrderImplement();    //Add to order
		OrderImp.addOrder(order);
		
		for (OrderDetail orderDetail : OrderDetails) {
			OrderDetailImplement OrderDet = new OrderDetailImplement();    
			OrderDet.addOrderDetail(orderDetail);
		}
		          
				
		/*try {
			Connection conn;
			{
				OrderDetailImplement OrderDet = new OrderDetailImplement();
				OrderDet.addOrderDetail(orderdetail);
			}
		} catch (Exception e){
			e.printStackTrace();
			return false;
		}*/
		
		
		
		return true;	
	
	}
}
