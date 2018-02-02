package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Delivery;

public interface DeliveryDAO {
	public void addDelivery ( Delivery delivery );
	public void deleteDelivery ( int deliveryId );
	public void updateDelivery ( Delivery delivery );
	public List<Delivery> getDelivery();
	public Delivery getDeliverybyID ( int deliveryId );
}
