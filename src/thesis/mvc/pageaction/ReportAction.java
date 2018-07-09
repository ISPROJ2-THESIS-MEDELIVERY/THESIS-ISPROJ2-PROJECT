package thesis.mvc.pageaction;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import javax.swing.text.rtf.RTFEditorKit;

import thesis.mvc.model.Order;
import thesis.mvc.utility.DBUtility;

public class ReportAction {

	
	private Connection conn;

	public ReportAction() {
		conn = DBUtility.getConnection();
	}
	
	public class PharmacySales {
		private String PharmacyName;
		private String ProductName;
		private int RegistrationNo;
		private int Quantity;
		private Double CostPerUnit;
		private Double TotalCost;
		public String getPharmacyName() {
			return PharmacyName;
		}
		public void setPharmacyName(String pharmacyName) {
			PharmacyName = pharmacyName;
		}
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public int getRegistrationNo() {
			return RegistrationNo;
		}
		public void setRegistrationNo(int registrationNo) {
			RegistrationNo = registrationNo;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public Double getCostPerUnit() {
			return CostPerUnit;
		}
		public void setCostPerUnit(Double costPerUnit) {
			CostPerUnit = costPerUnit;
		}
		public Double getTotalCost() {
			return TotalCost;
		}
		public void setTotalCost(Double totalCost) {
			TotalCost = totalCost;
		}
	}
	
	public PharmacySales ReportPharmacySales(int BranchID) {
		PharmacySales pharmacySales = new PharmacySales();
			
		try(PreparedStatement stmt = conn.prepareStatement("SELECT"
														+ " branch.PharmacyName,"
														+ " product.ProductName,"
														+ " product.RegistrationNo,"
														+ " orderdetail.Quantity,"
														+ " orderdetail.CostPerUnit,"
														+ " orderdetail.TotalCost"
														+ " FROM product"
														+ " INNER JOIN orderdetail ON orderdetail.ProductID = product.ProductID"
														+ " INNER JOIN `order` ON orderdetail.OrderID = `order`.OrderID"
														+ " INNER JOIN pharmacist ON `order`.PharmacistID = pharmacist.PharmacistID"
														+ " INNER JOIN branch ON pharmacist.BranchID = branch.BranchID WHERE branch.BranchID = " +Integer.toString(BranchID) ) ) {
		    stmt.setInt(1, BranchID);
		    try(ResultSet rs = stmt.executeQuery()) {
		        if (rs.next()) {
		        	pharmacySales.setPharmacyName(rs.getString(1));
		        	pharmacySales.setProductName(rs.getString(2));
		        	pharmacySales.setRegistrationNo(rs.getInt(3));
		        	pharmacySales.setQuantity(rs.getInt(4));
		        	pharmacySales.setCostPerUnit(rs.getDouble(5));
		        	pharmacySales.setTotalCost(rs.getDouble(6));
		        	return pharmacySales;
		        }  else {
		            return null;
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    return null;
		}
	}
	
	public class ProductSales {
		private String ProductName;
		private int RegistrationNo;
		private int Quantity;
		private Double TotalCost;
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public int getRegistrationNo() {
			return RegistrationNo;
		}
		public void setRegistrationNo(int registrationNo) {
			RegistrationNo = registrationNo;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public Double getTotalCost() {
			return TotalCost;
		}
		public void setTotalCost(Double totalCost) {
			TotalCost = totalCost;
		}
	}
	public ProductSales ReportProductSales(int ProductID) {
		ProductSales productSales = new ProductSales();
			
		try(PreparedStatement stmt = conn.prepareStatement("")) {
		    try(ResultSet rs = stmt.executeQuery()) {
		        if (rs.next()) {
		        	productSales.setProductName(rs.getString(1));
		        	productSales.setRegistrationNo(rs.getInt(2));
		        	productSales.setQuantity(rs.getInt(3));
		        	productSales.setTotalCost(rs.getDouble(4));
		        	return productSales;
		        }  else {
		            return null;
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    return null;
		}
	}
	public class CustomerSales {
		private Date DateOrdered;
		private Date DateProcessed;
		private Date DateDelivered;
		private String ProductName;
		private int RegistrationNo;
		private int Quantity;
		private double CostPerUnit;
		private double TotalCost;
		private double ActualCost;
		public Date getDateOrdered() {
			return DateOrdered;
		}
		public void setDateOrdered(Date dateOrdered) {
			DateOrdered = dateOrdered;
		}
		public Date getDateProcessed() {
			return DateProcessed;
		}
		public void setDateProcessed(Date dateProcessed) {
			DateProcessed = dateProcessed;
		}
		public Date getDateDelivered() {
			return DateDelivered;
		}
		public void setDateDelivered(Date dateDelivered) {
			DateDelivered = dateDelivered;
		}
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public int getRegistrationNo() {
			return RegistrationNo;
		}
		public void setRegistrationNo(int registrationNo) {
			RegistrationNo = registrationNo;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public double getCostPerUnit() {
			return CostPerUnit;
		}
		public void setCostPerUnit(double costPerUnit) {
			CostPerUnit = costPerUnit;
		}
		public double getTotalCost() {
			return TotalCost;
		}
		public void setTotalCost(double totalCost) {
			TotalCost = totalCost;
		}
		public double getActualCost() {
			return ActualCost;
		}
		public void setActualCost(double actualCost) {
			ActualCost = actualCost;
		}
	}
	public CustomerSales ReportCustomerSales(int UserID) {
		CustomerSales customerSales = new CustomerSales();
		
		try(PreparedStatement stmt = conn.prepareStatement("SELECT" + 
														" order.CustomerID," + 
														" order.DateOrdered," + 
														" order.DateProcessed," + 
														" order.DateDelivered," + 
														" order.OrderType," + 
														" order.OrderStatus," + 
														" order.PaymentMethod," + 
														" order.ActualCost," + 
														" orderdetail.ProductID," + 
														" orderdetail.Quantity," + 
														" orderdetail.CostPerUnit," + 
														" orderdetail.TotalCost" + 
														" FROM" + 
														" order" + 
														" INNER JOIN orderdetail ON orderdetail.OrderID = order.OrderID" + 
														" where CustomerID = " + UserID)) {
		    try(ResultSet rs = stmt.executeQuery()) {
		        if (rs.next()) {
		        	customerSales.setDateOrdered(rs.getDate(1));
		        	customerSales.setDateProcessed(rs.getDate(2));
		        	customerSales.setDateDelivered(rs.getDate(3));
		        	customerSales.setProductName(rs.getString(4));
		        	customerSales.setRegistrationNo(rs.getInt(5));
		        	customerSales.setQuantity(rs.getInt(6));
		        	customerSales.setCostPerUnit(rs.getDouble(7));
		        	customerSales.setTotalCost(rs.getDouble(8));
		        	customerSales.setActualCost(rs.getDouble(9));
		        	return customerSales;
		        }  else {
		            return null;
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    return null;
		}
	}
	public class TotalSales{
		private String ProductName;
		private int RegistrationNo;
		private int Quantity;
		private double CostPerUnit;
		private double TotalCost;
		private double ActualCost;
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public int getRegistrationNo() {
			return RegistrationNo;
		}
		public void setRegistrationNo(int registrationNo) {
			RegistrationNo = registrationNo;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public double getCostPerUnit() {
			return CostPerUnit;
		}
		public void setCostPerUnit(double costPerUnit) {
			CostPerUnit = costPerUnit;
		}
		public double getTotalCost() {
			return TotalCost;
		}
		public void setTotalCost(double totalCost) {
			TotalCost = totalCost;
		}
		public double getActualCost() {
			return ActualCost;
		}
		public void setActualCost(double actualCost) {
			ActualCost = actualCost;
		}
	}
	public TotalSales ReportTotalSales() {
		TotalSales totalSales = new TotalSales();
		
		try(PreparedStatement stmt = conn.prepareStatement("")) {
		    try(ResultSet rs = stmt.executeQuery()) {
		        if (rs.next()) {
		        	totalSales.setProductName(rs.getString(1));
		        	totalSales.setRegistrationNo(rs.getInt(2));
		        	totalSales.setQuantity(rs.getInt(3));
		        	totalSales.setCostPerUnit(rs.getDouble(4));
		        	totalSales.setTotalCost(rs.getDouble(5));
		        	totalSales.setActualCost(rs.getDouble(6));
		        	return totalSales;
		        }  else {
		            return null;
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    return null;
		}
	}
	
}
