package thesis.mvc.dataobjects;

import java.util.List;

import thesis.mvc.model.Customer;

public interface CustomerDAO {
	public void addCustomer ( Customer customer );
	public void deleteCustomer ( int customerId );
	public void updateCustomer ( Customer customer );
	public List<Customer> getAllCustomers();
	public Customer getCustomerById ( int customerId );

}
