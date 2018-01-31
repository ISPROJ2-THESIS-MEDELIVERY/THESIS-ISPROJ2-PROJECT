package thesis.mvc.model;

public class OrderDetail {

	private int OrderDetailsID;
	private int OrderID;
	private int ProductID;
	private int Quantity;
	private double CostPerUnit;
	private double TotalCost;
	private double ActualCost;
	
	public int getOrderDetailsID() {
		return OrderDetailsID;
	}
	public void setOrderDetailsID(int orderDetailsID) {
		OrderDetailsID = orderDetailsID;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
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
