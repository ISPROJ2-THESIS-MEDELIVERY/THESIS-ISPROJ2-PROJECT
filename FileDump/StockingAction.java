package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.utility.DBUtility;

public class StockingAction {
	
	
	//Normal part
	private Connection conn;

	public StockingAction() {
		conn = DBUtility.getConnection();
	}
	
	public class ProductList {
		private int StockID;
		private int ProductID;
		private String ProductName;
		private int BranchID;
		private String PharmacyName;
		private int Quantity;
		private String City;
		private boolean Featured;
		
		public int getStockID() {
			return StockID;
		}
		public void setStockID(int stockID) {
			StockID = stockID;
		}
		public int getProductID() {
			return ProductID;
		}
		public void setProductID(int productID) {
			ProductID = productID;
		}
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public int getBranchID() {
			return BranchID;
		}
		public void setBranchID(int branchID) {
			BranchID = branchID;
		}
		public String getPharmacyName() {
			return PharmacyName;
		}
		public void setPharmacyName(String pharmacyName) {
			PharmacyName = pharmacyName;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public String getCity() {
			return City;
		}
		public void setCity(String city) {
			City = city;
		}
		public boolean isFeatured() {
			return Featured;
		}
		public void setFeatured(boolean featured) {
			Featured = featured;
		}
		
	}
	public List<ProductList> listStock(){
		List<ProductList> productLists = new ArrayList<ProductList>();
		try {
				Statement statement = conn.createStatement();
				ResultSet resultSet = statement.executeQuery(""
				+ "SELECT StockID, Stocks.ProductID, ProductName, Stocks.BranchID, PharmacyName, Quantity, Feature, CityName "
				+ "FROM Stocks "
				+ "INNER JOIN Product ON Stocks.ProductID = Product.ProductID "
				+ "INNER JOIN Branch ON Stocks.BranchID = Branch.BranchID "
				+ "INNER JOIN Citylisting ON Citylisting.CityID = Branch.CityID");
				while( resultSet.next() ) {
					ProductList productList = new ProductList();
					productList.setStockID( Integer.parseInt( resultSet.getString(1) ) );
					productList.setProductID( Integer.parseInt( resultSet.getString(2) ) );
					productList.setProductName( resultSet.getString(3) );
					productList.setBranchID( Integer.parseInt( resultSet.getString(4) ) );
					productList.setPharmacyName( resultSet.getString(5) );
					productList.setQuantity( Integer.parseInt( resultSet.getString(6) ) );
					productList.setFeatured( Boolean.getBoolean( resultSet.getString(7) ) );
					productList.setCity( resultSet.getString(8) );
					productLists.add(productList);
				}
				resultSet.close();
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productLists;
		
	}
	
	public boolean ChangePrice(int StockID, double NewPrice){
    	//change the boolean to false to ensure that the old price is kicked out
		try(PreparedStatement stmt = conn.prepareStatement(""
    			+ "UPDATE StocksPrice SET IsCurrent = 0 WHERE StockID = ? AND IsCurrent = 1")) {
            stmt.setInt(1, StockID);
            stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
    		return false;
        }
    	//Add the new price in
    	try {
        	StocksPriceImplement stocksPriceImp = new StocksPriceImplement();
        	StocksPrice stocksPrice = new StocksPrice();
        	stocksPrice.setStockID(StockID);
        	stocksPrice.setPriceSet(NewPrice);
        	stocksPrice.setIsCurrent(true);
        	stocksPriceImp.addStocksPrice(stocksPrice);
        } catch (Exception e) {
            e.printStackTrace();
    		return false;
        }
    	//Audit
		return true;
	}
	public boolean AddStock(Stocks stocks){
		StocksImplement StocksImp = new StocksImplement();
		try {
			StocksImp.addStocks(stocks);
		} catch (Exception e) {
            e.printStackTrace();
    		return false;
        }
		
		return true;
	}
	public boolean AddProduct(Product product){
		ProductImplement ProductImp = new ProductImplement();
		try {
			ProductImp.addProduct(product);
		} catch (Exception e) {
            e.printStackTrace();
    		return false;
        }
		return true;
	}

}
