package thesis.mvc.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Order {
	private int OrderID;
	private int CustomerID;
	private int DeliveryID;
	private int PharmacistID;
	private int PharmacyID;
	private int BranchID;
	private int CityID;
	private int PrescriptionID;
	private String OrderAddress;
	private Timestamp DateOrdered;
	private Timestamp DateProcessed;
	private Timestamp DateDelivered;
	private String OrderType;
	private String OrderStatus;
	private Boolean SeniorDiscount;
	private String PaymentMethod;
	private double ActualCost;
	private String PaymayaID;
	
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
	public int getDeliveryID() {
		return DeliveryID;
	}
	public void setDeliveryID(int deliveryID) {
		DeliveryID = deliveryID;
	}
	public int getPharmacistID() {
		return PharmacistID;
	}
	public void setPharmacistID(int pharmacistID) {
		PharmacistID = pharmacistID;
	}
	public int getPharmacyID() {
		return PharmacyID;
	}
	public void setPharmacyID(int pharmacyID) {
		PharmacyID = pharmacyID;
	}
	public int getBranchID() {
		return BranchID;
	}
	public void setBranchID(int branchID) {
		BranchID = branchID;
	}
	public int getCityID() {
		return CityID;
	}
	public void setCityID(int cityID) {
		CityID = cityID;
	}
	public int getPrescriptionID() {
		return PrescriptionID;
	}
	public void setPrescriptionID(int prescriptionID) {
		PrescriptionID = prescriptionID;
	}
	public String getOrderAddress() {
		return OrderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		OrderAddress = orderAddress;
	}
	public Timestamp getDateOrdered() {
		return DateOrdered;
	}
	public void setDateOrdered(Timestamp dateOrdered) {
		DateOrdered = dateOrdered;
	}
	public Timestamp getDateProcessed() {
		return DateProcessed;
	}
	public void setDateProcessed(Timestamp dateProcessed) {
		DateProcessed = dateProcessed;
	}
	public Timestamp getDateDelivered() {
		return DateDelivered;
	}
	public void setDateDelivered(Timestamp dateDelivered) {
		DateDelivered = dateDelivered;
	}
	public String getOrderType() {
		return OrderType;
	}
	public void setOrderType(String orderType) {
		OrderType = orderType;
	}
	public String getOrderStatus() {
		return OrderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		OrderStatus = orderStatus;
	}
	public Boolean getSeniorDiscount() {
		return SeniorDiscount;
	}
	public void setSeniorDiscount(Boolean seniorDiscount) {
		SeniorDiscount = seniorDiscount;
	}
	public String getPaymentMethod() {
		return PaymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}
	public double getActualCost() {
		return ActualCost;
	}
	public void setActualCost(double actualCost) {
		ActualCost = actualCost;
	}
	public String getPaymayaID() {
		return PaymayaID;
	}
	public void setPaymayaID(String paymayaID) {
		PaymayaID = paymayaID;
	}
	
	
}
