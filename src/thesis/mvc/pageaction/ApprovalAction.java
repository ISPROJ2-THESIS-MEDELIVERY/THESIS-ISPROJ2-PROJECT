package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.model.Order;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

public class ApprovalAction {
	private Connection conn;

	public ApprovalAction() {
		conn = DBUtility.getConnection();
	}
	
	//List the the products
	public List<Product> getProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Product WHERE isRXProduct = 0" );
			while( resultSet.next() ) {
				Product product = new Product();
				product.setProductID( resultSet.getInt( "ProductID" ) );
				product.setProductName( resultSet.getString( "ProductName" ) );
				product.setGenericName( resultSet.getString( "GenericName" ) );
				product.setRegistrationNo( resultSet.getString( "RegistrationNo" ) );
				product.setProductStrength( resultSet.getString( "ProductStrength" ) );
				product.setProductForm( resultSet.getString( "ProductForm" ) );
				product.setProductPackaging( resultSet.getString( "ProductPackaging" ) );
				product.setProductManufacturer( resultSet.getString( "ProductManufacturer" ) );
				product.setProductOrigin( resultSet.getString( "ProductOrigin" ) );
				product.setProductDescription( resultSet.getString( "ProductDescription" ) );
				product.setProductImage( resultSet.getString( "ProductImage" ) );
				product.setRXProduct( resultSet.getBoolean( "isRXProduct" ) );
				product.setCounterLimit( resultSet.getInt( "CounterLimit" ) );
				products.add(product);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	
	//Add city in order to 
	public List<Order> getOrder(int BranchID) {
		List<Order> orders = new ArrayList<Order>();
		
		String Hold = "Select customer.CustomerName, `order`.OrderAddress, citylisting.CityName, `order`.DateOrdered, `order`.OrderType, `order`.SeniorDiscount, `order`.PaymentMethod, `order`.ActualCost, `order`.PrescriptionID From `order` Inner Join customer On `order`.CustomerID = customer.CustomerID Inner Join citylisting On customer.CityID = citylisting.CityID, branch Where `order`.CityID = branch.CityID And `order`.OrderStatus = 'PENDING' And branch.BranchID = ?";
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM `order` WHERE OrderStatus = 'PENDING' AND BranchID = ?")) {
	        stmt.setInt(1, BranchID);
	        try(ResultSet resultSet = stmt.executeQuery()) {
	        	while( resultSet.next() ) {
					Order order = new Order();
					order.setOrderID( resultSet.getInt( "OrderID" ) );
					order.setCustomerID( resultSet.getInt( "CustomerID" ) );
					order.setDeliveryID( resultSet.getInt( "DeliveryID" ) );
					order.setPharmacistID( resultSet.getInt( "PharmacistID" ) );
					order.setCityID( resultSet.getInt( "CityID" ) );
					order.setPrescriptionID( resultSet.getInt( "PrescriptionID" ) );
					order.setOrderAddress( resultSet.getString( "OrderAddress" ) );
					order.setDateOrdered( resultSet.getDate( "DateOrdered" ) );
					order.setDateProcessed( resultSet.getDate( "DateProcessed" ) );
					order.setDateDelivered( resultSet.getDate( "DateDelivered" ) );
					order.setOrderType( resultSet.getString( "OrderType" ) );
					order.setOrderStatus( resultSet.getString( "OrderStatus" ) );
					order.setSeniorDiscount( resultSet.getBoolean( "SeniorDiscount" ) );
					order.setPaymentMethod( resultSet.getString( "PaymentMethod" ) );
					orders.add(order);
				}
	        }
	        return orders;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
