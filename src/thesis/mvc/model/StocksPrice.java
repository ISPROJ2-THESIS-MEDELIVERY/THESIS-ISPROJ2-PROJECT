package thesis.mvc.model;

import java.sql.Date;

public class StocksPrice {
	
	private int StocksPriceID;
	private int StockID;
	private double PriceSet;
	private Date DateSet;
	private boolean IsCurrent;
	
	public int getStocksPriceID() {
		return StocksPriceID;
	}
	public void setStocksPriceID(int stocksPriceID) {
		StocksPriceID = stocksPriceID;
	}
	public int getStockID() {
		return StockID;
	}
	public void setStockID(int stockID) {
		StockID = stockID;
	}
	public double getPriceSet() {
		return PriceSet;
	}
	public void setPriceSet(double priceSet) {
		PriceSet = priceSet;
	}
	public Date getDateSet() {
		return DateSet;
	}
	public void setDateSet(Date dateSet) {
		DateSet = dateSet;
	}
	public boolean isIsCurrent() {
		return IsCurrent;
	}
	public void setIsCurrent(boolean isCurrent) {
		IsCurrent = isCurrent;
	}

}
