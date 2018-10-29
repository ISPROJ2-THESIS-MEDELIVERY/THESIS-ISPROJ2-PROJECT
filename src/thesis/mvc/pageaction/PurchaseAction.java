package thesis.mvc.pageaction;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import thesis.mvc.model.Order;
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
	
	public int addPrescriptionOrder(Order order) {
		try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO `order`(`CustomerID`, `CityID`, `PrescriptionID`, `PharmacyID`, `OrderAddress`, `DateOrdered`, `OrderType`, `OrderStatus`, `SeniorDiscount`) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query, Statement.RETURN_GENERATED_KEYS );
			preparedStatement.setInt( 1, order.getCustomerID() );
			preparedStatement.setInt( 2, order.getCityID() );
			preparedStatement.setInt( 3, order.getPrescriptionID() );
			preparedStatement.setInt( 4, order.getPharmacyID() );
			preparedStatement.setString( 5, order.getOrderAddress() );
			preparedStatement.setDate( 6, CurrentDate );
			preparedStatement.setString( 7, order.getOrderType() );
			preparedStatement.setString( 8, order.getOrderStatus() );
			preparedStatement.setBoolean( 9, order.getSeniorDiscount() );
			
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
	
	public Order setInitalOrder(int custID, String address, boolean senior, int cityID, int pharmacyID) {
		Order order = new Order();
		order.setCustomerID(custID);           
		order.setOrderAddress(address); 
		order.setSeniorDiscount(senior);
		order.setCityID(cityID);
		order.setPharmacyID(pharmacyID);
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
	
	public double getProductCost(int ProductID, int Pharmacy, Order order) {

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
														" stocks.PharmacyID = ?")) {
            stmt.setInt(1, ProductID);
            stmt.setInt(2, Pharmacy);
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
	
	
	
}
