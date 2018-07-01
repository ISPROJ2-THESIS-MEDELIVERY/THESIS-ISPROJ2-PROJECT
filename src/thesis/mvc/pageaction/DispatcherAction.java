package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.SQLException;
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
	
	public boolean DispatcherOrder(int OrderID, int DispatcherID, int DriverID, String Comments) {
		try {
			Delivery delivery = null;
			delivery.setComments(Comments);
			delivery.setDriverID(DriverID);
			delivery.setDispatcherID(DispatcherID);
			delivery.setComments(Comments);
			
			DeliveryImplement deliveryImplement = new DeliveryImplement();
			int DeliveryID = deliveryImplement.addDelivery(delivery);
			
			OrderImplement orderImplement = new OrderImplement();
			Order updateOrder = orderImplement.getOrderById(OrderID);
			updateOrder.setDeliveryID( DeliveryID );
			
			orderImplement.updateOrder(updateOrder);
			
			return true;
		} catch (Exception e) {
			return false;			
		}
	}
}
