package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.OrderDetail;

public interface OrderDetailDAO {
	public int addOrderDetail ( OrderDetail orderDetail );
	public void deleteOrderDetail ( int orderDetailId );
	public void updateOrderDetail ( OrderDetail orderDetail );
	public List<OrderDetail> getOrderDetail();
	public OrderDetail getOrderDetailById( int orderDetailId );
}