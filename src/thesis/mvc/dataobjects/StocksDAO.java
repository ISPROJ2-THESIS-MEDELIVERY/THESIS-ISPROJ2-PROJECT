package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Stocks;

public interface StocksDAO {
	public int addStocks ( Stocks stocks );
	public void deleteStocks ( int stocksId );
	public void updateStocks ( Stocks stocks );
	public List<Stocks> getAllStocks();
	public Stocks getStocksById ( int stocksId );
}
