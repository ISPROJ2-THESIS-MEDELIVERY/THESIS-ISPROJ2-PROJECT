package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.utility.DBUtility;

public class HomeAction {
	
	private Connection conn;

	public HomeAction() {
		conn = DBUtility.getConnection();
	}
	
	public class Display {
		private String Product;
		private String Pharmacy;
		private float Price;
		private int Quantity;
		public String getProduct() {
			return Product;
		}
		public void setProduct(String product) {
			Product = product;
		}
		public String getPharmacy() {
			return Pharmacy;
		}
		public void setPharmacy(String pharmacy) {
			Pharmacy = pharmacy;
		}
		public float getPrice() {
			return Price;
		}
		public void setPrice(float price) {
			Price = price;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		
	}
	
	public List<Display> displayStock() {
		List<Display> displays = new ArrayList<Display>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( ""
					+ "SELECT P.ProductName, B.PharmacyName, SP.PriceSet, S.Quantity\r\n"
					+ "FROM Stocks S WHERE S.Feature = 1 AND SP.CurrentPrice = 1\r\n"
					+ "INNER JOIN Product P ON S.ProductID = P.ProductID\r\n"
					+ "INNER JOIN Branch B ON S.BranchID = B.BranchID\r\n"
					+ "INNER JOIN StockPrice SP ON S.BranchID = B.BranchID\r\n"
					+ "ORDER BY B.PharmacyName");
			while( resultSet.next() ) {
				Display display = new Display();
				display.setProduct( resultSet.getString(1) );
				display.setPharmacy( resultSet.getString(2) );
				display.setPrice( resultSet.getInt(3) );
				display.setQuantity( resultSet.getInt(4) );
				displays.add(display);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return displays;
	}
	
}
