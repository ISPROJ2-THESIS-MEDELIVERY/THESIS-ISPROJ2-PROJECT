package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

public class SearchAction {
	
	private Connection conn;

	public SearchAction() {
		conn = DBUtility.getConnection();
	}
	public List<Product> GeneralListing(String searchQuerty, int searchFilter) {
		String Query = "SELECT * FROM Product WHERE";
		
		if (searchQuerty != null) {
			Query += "GenericName LIKE %" + searchQuerty + "%";
		} if (searchQuerty == null && searchFilter == 0) {
			Query += "1";
		}
		
		List<Product> products = new ArrayList<Product>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( Query );
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
	public List<Product> ProductListing(String searchQuerty, int searchFilter) {
		conn = DBUtility.getConnection();
		String Query = "";
		if(searchFilter == 1){
			Query = "SELECT * FROM Product"
					+ " ORDER BY ProductName DESC"
					+ " WHERE ProductName LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 2){
			Query = "SELECT * FROM Product"
					+ " ORDER BY GenericName DESC"
					+ " WHERE GenericName LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 3){
			Query = "SELECT * FROM Product"
					+ " ORDER BY RegistrationNumber DESC"
					+ " WHERE RegistrationNumber LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 4){
			Query = "SELECT * FROM Product"
					+ " ORDER BY isRXProduct DESC"
					+ " WHERE isRXProduct = 1";
		}
		else if(searchFilter == 5){
			Query = "SELECT * FROM Product"
					+ " ORDER BY isRXProduct DESC"
					+ " WHERE isRXProduct = 0";
		}
		else if(searchFilter == 6){
			Query = "SELECT * FROM Product"
					+ " ORDER BY CounterLimit DESC"
					+ " WHERE CounterLimit LIKE '%" + searchQuerty + "%'";
		}
		else {
			Query = "SELECT * FROM Product"
					+ " ORDER BY ProductID";
		}
		List<Product> products = new ArrayList<Product>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( Query );
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
}
