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

	public RegistrationAction() {
		conn = DBUtility.getConnection();
	}
	
	public List<Product> ProductListing(int Selection) {
		String Query = "";
		if(Selection == 1){
			Query = "SELECT * FROM Product"
					+ "ORDER BY ProductID DESC";
		}
		else if(Selection == 2){
			Query = "SELECT * FROM Product"
					+ "ORDER BY ProductName DESC";
		}
		else if(Selection == 3){
			Query = "SELECT * FROM Product"
					+ "ORDER BY GenericName DESC";
		}
		else if(Selection == 4){
			Query = "SELECT * FROM Product"
					+ "ORDER BY RegistrationNumber DESC";
		}
		else if(Selection == 5){
			Query = "SELECT * FROM Product"
					+ "ORDER BY isRXProduct DESC";
		}
		else if(Selection == 6){
			Query = "SELECT * FROM Product"
					+ "ORDER BY CounterLimit DESC";
		}
		else {
			Query = "SELECT * FROM Product"
					+ "ORDER BY ProductID";
		}
		List<Product> products = new ArrayList<Product>();
		Statement statement = conn.createStatement();
		ResultSet resultSet = statement.executeQuery( Query );
		try {
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
