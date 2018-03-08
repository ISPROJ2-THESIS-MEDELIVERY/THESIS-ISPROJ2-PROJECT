package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		
		for (OrderDetail orderDetail : OrderDetails) {
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){
				
				stmt.setInt(1,  orderDetail.getProductID() );
				
				int limit;
				boolean rx = false;
				
				//Check if the quantity of each item in the order is less than the limit
				try(ResultSet rs = stmt.executeQuery()){
					limit = rs.getInt("CounterLimit");
				} if (orderDetail.getQuantity() > limit) {
					return false;
				}
				
				//Check if items in the order is RX
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
		
		//Get the city of the customer
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
		
		if (CityCustomer == CityPharmacy) {   //Check if city is equal or not
			order.setOrderType("Intercity Delivery");
		} else {
			order.setOrderType("Intracity Delivery");
		}
		//Add nessesary information

		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		order.setDateOrdered(CurrentDate);
		
		order.setOrderStatus( "PENDING" );
		
		//Add to order
		OrderImplement OrderImp = new OrderImplement();
		OrderImp.addOrder(order);
		
		//Add to order items
		for (OrderDetail orderDetail : OrderDetails) {
			OrderDetailImplement OrderDet = new OrderDetailImplement();    
			OrderDet.addOrderDetail(orderDetail);
		}		
		
		return true;
	}
	
	public boolean pharmacistApproval(int orderID, boolean aprroval) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		if(aprroval) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE order SET OrderStatus = 'APPROVED', DateProcessed = ? WHERE OrderID = ?")) {
	            stmt.setDate(1, CurrentDate);
				stmt.setInt(2, orderID);
				stmt.executeQuery();
				stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
		} else {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE order SET OrderStatus = 'CANCELLED' WHERE OrderID = ?")) {
	            stmt.setInt(1, orderID);
	            stmt.executeQuery();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
		}
		
		return false;
	}
	
}
