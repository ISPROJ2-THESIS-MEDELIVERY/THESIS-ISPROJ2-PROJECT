package thesis.mvc.model;

import java.sql.Date;

public class Order {
	private int OrderID;
	private int CustomerID;
	private int DeliveryID;
	private int PharmacistID;
	private int CityID;
	private int PrescriptionID;
	private String OrderAddress;
	private Date DateOrdered;
	private Date DateProcessed;
	private Date DateDelivered;
	private String OrderType;
	private String OrderStatus;
	private Boolean SeniorDiscount;
	private String PaymentMethod;
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
	public Date getDateOrdered() {
		return DateOrdered;
	}
	public void setDateOrdered(Date dateOrdered) {
		DateOrdered = dateOrdered;
	}
	public Date getDateProcessed() {
		return DateProcessed;
	}
	public void setDateProcessed(Date dateProcessed) {
		DateProcessed = dateProcessed;
	}
	public Date getDateDelivered() {
		return DateDelivered;
	}
	public void setDateDelivered(Date dateDelivered) {
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

	
	
}
