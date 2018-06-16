package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Order;

public interface OrderDAO {
	public int addOrder ( Order order );
	public void deleteOrder ( int orderId );
	public void updateOrder ( Order order );
	public List<Order> getOrder();
	public Order getOrderById( int orderId );
}
