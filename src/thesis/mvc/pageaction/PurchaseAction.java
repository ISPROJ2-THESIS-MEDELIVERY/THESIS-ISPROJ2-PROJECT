package thesis.mvc.pageaction;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;

import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.utility.DBUtility;

public class PurchaseAction {
	
	private Connection conn;

	public PurchaseAction() {
		conn = DBUtility.getConnection();
	}
	
	public int addIncompleteOrder(Order order) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO `order` (CustomerID, CityID, PharmacyID, OrderAddress, DateOrdered, OrderType, OrderStatus, SeniorDiscount, ActualCost) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query, Statement.RETURN_GENERATED_KEYS );
			preparedStatement.setInt( 1, order.getCustomerID() );
			preparedStatement.setInt( 2, order.getCityID() );
			preparedStatement.setInt( 3, order.getPharmacyID() );
			preparedStatement.setString( 4, order.getOrderAddress() );
			preparedStatement.setDate( 5, CurrentDate );
			preparedStatement.setString( 6, order.getOrderType() );
			preparedStatement.setString( 7, order.getOrderStatus() );
			preparedStatement.setBoolean( 8, order.getSeniorDiscount() );
			preparedStatement.setDouble( 9, order.getActualCost() );
			
			preparedStatement.executeUpdate();
			int NewID = 0;
			ResultSet rs = preparedStatement.getGeneratedKeys();
			if (rs.next()) {
				NewID = rs.getInt(1);
			}
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public Order setInitalOrder(int custID, String address, boolean senior, int cityID, int branchID) {
		Order order = new Order();
		order.setCustomerID(custID);           
		order.setOrderAddress(address); 
		order.setSeniorDiscount(senior);
		order.setCityID(cityID);
		order.setBranchID(branchID);
		return order;
	}
	public class CartList {
		private String Name;
		private String Description;
		private String Image;
		private String Size;
		private boolean Prescription;
		private int Quantity;
		private double UnitCost;
		private double TotalCost;
		
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public String getDescription() {
			return Description;
		}
		public void setDescription(String description) {
			Description = description;
		}
		public String getImage() {
			return Image;
		}
		public void setImage(String image) {
			Image = image;
		}
		public String getSize() {
			return Size;
		}
		public void setSize(String size) {
			Size = size;
		}
		public boolean isPrescription() {
			return Prescription;
		}
		public void setPrescription(boolean prescription) {
			Prescription = prescription;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public double getUnitCost() {
			return UnitCost;
		}
		public void setUnitCost(double unitCost) {
			UnitCost = unitCost;
		}
		public double getTotalCost() {
			return TotalCost;
		}
		public void setTotalCost(double totalCost) {
			TotalCost = totalCost;
		}
	}
	
	public double getProductCost(int ProductID, int Branch, Order order) {

		//Find the city of the customer
		BigDecimal productCost = null;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT" + 
														" stocksprice.PriceSet" +
														" FROM" + 
														" stocksprice" + 
														" INNER JOIN stocks ON stocksprice.StockID = stocks.StockID" + 
														" WHERE" + 
														" stocksprice.IsCurrent = 1 AND" + 
														" stocks.ProductID = ? AND" + 
														" stocks.BranchID = ?")) {
            stmt.setInt(1, ProductID);
            stmt.setInt(2, Branch);
            try(ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                	productCost = rs.getBigDecimal("PriceSet");
                }  else {
                    return 0.0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0.0;
        }
		
		return productCost.doubleValue();
	}
	
	public boolean purchaseOrder(Order order, List<OrderDetail> OrderDetails) {
		//Check if order has less than 5 items
		if (OrderDetails.size() > 5) { return false; }
		
		for (OrderDetail orderDetail : OrderDetails) {
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){
				
				stmt.setInt(1,  orderDetail.getProductID() );
				
				int limit;
				boolean rx;
				
				//Check if the quantity of each item in the order is less than the limit
				try(ResultSet rs = stmt.executeQuery()){
					if (rs.next()) {
						limit = rs.getInt("CounterLimit");
						rx = rs.getBoolean("isRXProduct");
						if (orderDetail.getQuantity() > limit || rx == true) {
							return false;
						}
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}		
		
		//Get the city of the customer & senior status
		int CityCustomer = 0;
		boolean SeniorStatus = false;
		String CustoAddress = "Error";
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, order.getCustomerID());
            try(ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
	            	CityCustomer = rs.getInt("CityID");
					SeniorStatus = rs.getBoolean("IsSeniorCitizen");
					CustoAddress = rs.getString("Address");
				}
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
		
		//Where is the branch located
		int CityPharmacy = -1;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM branch WHERE CityID = ?")) {
			stmt.setInt(1, CityCustomer);
			try(ResultSet rs = stmt.executeQuery()){
				if (rs.next()) {
					CityPharmacy = rs.getInt("CityID");
				}
			}
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		order.setSeniorDiscount(SeniorStatus);
		order.setOrderAddress(CustoAddress);
		
		//Check if city is equal or not
		Double DeliveryCost;
		if (CityCustomer == CityPharmacy) {
			order.setOrderType("Intercity Regular");
			DeliveryCost = 50.0;
			
		} else {
			order.setOrderType("Intracity Regular");
			DeliveryCost = 100.0;
		}
		
		//Add nessesary information
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		order.setDateOrdered(CurrentDate);
		order.setOrderStatus( "PENDING" );
		
		//Add delivery cost and Input order detail
		Double actualcost = 0.0;
		OrderDetailImplement OrderDet = new OrderDetailImplement();  
		for (OrderDetail orderDetail : OrderDetails) {
			actualcost += orderDetail.getTotalCost();
		}
		actualcost += DeliveryCost;
		order.setActualCost( actualcost );
		
		//Add to order
		int orderID = addIncompleteOrder(order);
		//insert OrderID
		for (OrderDetail orderDetail : OrderDetails) {
			orderDetail.setOrderID( orderID );
			OrderDet.addOrderDetail( orderDetail );
		}
		
		return true;
	}
	
}
