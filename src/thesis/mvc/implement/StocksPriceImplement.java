package thesis.mvc.implement;

import java.sql.Connection;
import java.util.List;

import thesis.mvc.dataobjects.StocksPriceDAO;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.utility.DBUtility;

public class StocksPriceImplement implements StocksPriceDAO{
	
	private Connection conn;

	public StocksPriceImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addStocksPrice(StocksPrice stocksPrice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStocksPrice(int stocksPriceId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStocksPrice(StocksPrice stocksPrice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<StocksPrice> getAllStocksPrice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StocksPrice getStocksPricebyId(int stocksPriceId) {
		// TODO Auto-generated method stub
		return null;
	}

}
