package thesis.mvc.pageaction;

import java.sql.Connection;
import java.util.List;

import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.model.Delivery;
import thesis.mvc.model.Dispatcher;
import thesis.mvc.model.Order;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

public class DispatcherAction {
	
	private Connection conn;

	public DispatcherAction() {
		conn = DBUtility.getConnection();
	}
	
	public boolean DispatcherAction(int OrderID, int DispatcherID, int DriverID, String Comments) {
		Delivery delivery = null;
		delivery.setComments(Comments);
		delivery.setDriverID(DriverID);
		delivery.setDispatcherID(DispatcherID);
		delivery.setComments(Comments);
		
		DeliveryImplement deliveryImplement = new DeliveryImplement();
		int DeliveryID = deliveryImplement.addDelivery(delivery);
		OrderImplement orderImplement = new OrderImplement();
		Order updateOrder = null;
		orderImplement.getOrderById( OrderID );
		if (OrderID == 1 && DriverID == 1) {
			
			return true;
		} else {
			return false;			
		}
	}
}
