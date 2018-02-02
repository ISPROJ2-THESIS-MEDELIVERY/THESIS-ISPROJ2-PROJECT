package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.CourierService;

public interface CourierServiceDAO {
	public void addCourierService ( CourierService courierService );
	public void deleteCourierService ( int courierServiceId );
	public void updateCourierService ( CourierService courierService );
	public List<CourierService> getAllCourierService();
	public CourierService getCourierServiceById ( int courierServiceId );
}
