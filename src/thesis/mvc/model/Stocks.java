package thesis.mvc.model;

public class Stocks {
	
	private int StockID;
	private int ProductID;
	private int BranchID;
	private int Quantity;
	private boolean Feature;
	
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
	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public boolean isFeature() {
		return Feature;
	}
	public void setFeature(boolean feature) {
		Feature = feature;
	}
	
}
