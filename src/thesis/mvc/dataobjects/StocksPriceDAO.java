package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.StocksPrice;

public interface StocksPriceDAO {
	public void addStocksPrice ( StocksPrice stocksPrice );
	public void deleteStocksPrice ( int stocksPriceId );
	public void updateStocksPrice ( StocksPrice stocksPrice );
	public List<StocksPrice> getAllStocksPrice(); 
	public StocksPrice getStocksPricebyId( int stocksPriceId );
}
