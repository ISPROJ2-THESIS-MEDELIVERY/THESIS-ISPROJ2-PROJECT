package thesis.mvc.model;

public class Stocks {
	
	private int StockID;
	private int ProductID;
	private int PharmacyID;
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
	public int getPharmacyID() {
		return PharmacyID;
	}
	public void setPharmacyID(int pharmacyID) {
		PharmacyID = pharmacyID;
	}
	public boolean isFeature() {
		return Feature;
	}
	public void setFeature(boolean feature) {
		Feature = feature;
	}
	
}
