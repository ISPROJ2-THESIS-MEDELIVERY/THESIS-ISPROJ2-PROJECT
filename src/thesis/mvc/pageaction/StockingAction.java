package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import thesis.mvc.implement.ProductImplement;
import thesis.mvc.implement.StocksImplement;
import thesis.mvc.implement.StocksPriceImplement;
import thesis.mvc.model.Product;
import thesis.mvc.model.Stocks;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.utility.DBUtility;

public class StockingAction {
	
	private Connection conn;

	public StockingAction() {
		conn = DBUtility.getConnection();
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
