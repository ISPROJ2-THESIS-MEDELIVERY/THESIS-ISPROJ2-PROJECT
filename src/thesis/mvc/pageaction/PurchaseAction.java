package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
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
	
	public double getProductCost(int ProductID, Order order) {

		//Find the city of the customer
		int CityCustomer = 0;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, order.getCustomerID());
            try(ResultSet rs = stmt.executeQuery()) {
            	CityCustomer = rs.getInt("CityID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0.0;
        }
		
		//Find the branch closest to the customer
		int BranchID;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM branch WHERE CityID = ?")) {
			stmt.setInt(1, CityCustomer);
			try(ResultSet rs = stmt.executeQuery()) {
				BranchID = rs.getInt("BranchID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return 0.0;
		}
		
		//Look for stocksID with productID and BranchID
		int stockID;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Stocks WHERE ProductID = ? AND BranchID = ?")) {
			stmt.setInt(1, ProductID);
			stmt.setInt(2, BranchID);
			try(ResultSet rs = stmt.executeQuery()) {
				stockID = rs.getInt("StockID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return 0.0;
		}
		
		//Retrieve the price from stocksPrice
		Double productCost;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT StocksPriceID FROM product WHERE StockID = ? AND isCurrent = 1 ")){
			stmt.setInt(1, stockID );
			//Check if items in the order is RX
			try(ResultSet rs = stmt.executeQuery()){
				productCost = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0.0;
		}
		
		return productCost;
	}
	
	
	public boolean purchaseOrder(Order order, List<OrderDetail> OrderDetails) {
		//Check if order has less than 5 items
		if (OrderDetails.size() > 5) { return false; }
		
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
		
		//Where is the branch located.
		int CityPharmacy = -1;
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM branch WHERE CityID = ?")) {
			stmt.setInt(1, CityCustomer);
			try(ResultSet rs = stmt.executeQuery()){
				CityPharmacy = rs.getInt("CityID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		
		//Check if city is equal or not
		Double DeliveryCost;
		if (CityCustomer == CityPharmacy) {
			order.setOrderType("Intercity Delivery");
			DeliveryCost = 50.0;
			
		} else {
			order.setOrderType("Intracity Delivery");
			DeliveryCost = 100.0;
		}
		
		//Add nessesary information
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		order.setDateOrdered(CurrentDate);
		order.setOrderStatus( "PENDING" );
		
		//Add to order
		OrderImplement OrderImp = new OrderImplement();
		OrderImp.addOrder(order);
		
		//Get orderID
		int orderID;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Order WHERE BranchID = ? AND CustomerID = ?")) {
			stmt.setDate(1, CurrentDate);
			stmt.setInt(2, order.getCustomerID());
			try(ResultSet rs = stmt.executeQuery()){
				orderID = rs.getInt("OrderID");
			}
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		
		//Add delivery cost and insert OrderID
		Double actualcost = 0.0;
		for (OrderDetail orderDetail : OrderDetails) {
			actualcost += orderDetail.getTotalCost();
		}
		actualcost += DeliveryCost;
		for (OrderDetail orderDetail : OrderDetails) {
			orderDetail.setActualCost( actualcost );
			orderDetail.setOrderID( orderID );
		}
		
		//Add to order items
		OrderDetailImplement OrderDet = new OrderDetailImplement();  
		for (OrderDetail orderDetail : OrderDetails) {  
			OrderDet.addOrderDetail( orderDetail );
		}		
		
		return true;
	}
	
	public boolean pharmacistApproval(int orderID, boolean aprroval) {
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		if(aprroval) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'APPROVED', DateProcessed = ? WHERE OrderID = ?")) {
	            stmt.setDate(1, CurrentDate);
				stmt.setInt(2, orderID);
				stmt.executeUpdate();
				stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
		} else {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'CANCELLED', DateProcessed = ? WHERE OrderID = ?")) {
				stmt.setDate(1, CurrentDate);
				stmt.setInt(2, orderID);
	            stmt.executeUpdate();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
		}
		
		return false;
	}
	
}
