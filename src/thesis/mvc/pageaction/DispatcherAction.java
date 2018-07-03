package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import thesis.mvc.controller.DispatcherController;
import thesis.mvc.implement.DeliveryImplement;
import thesis.mvc.implement.DispatcherImplement;
import thesis.mvc.implement.LoginImplement;
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
	
	public boolean DispatcherOrder(int OrderID, int UserID, int DriverID, String Comments) {
		try {
			DispatcherImplement dispatcherImplement = new DispatcherImplement();
			int DispatcherID = dispatcherImplement.getDispatcherByLogin(UserID).getDispatcherID();

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
