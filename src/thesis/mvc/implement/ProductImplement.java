package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.ProductDAO;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;

public class ProductImplement implements ProductDAO {
	
	private Connection conn;

	public ProductImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addProduct(Product product) {
		try {
			String query = "INSERT INTO Product (ProductName, GenericName, RegistrationNo, ProductStrength, ProductForm, ProductPackaging, ProductManufacturer, ProductOrigin, ProductDescription, ProductImage, isRXProduct, CounterLimit) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, product.getProductName() );
			preparedStatement.setString( 2, product.getGenericName() );
			preparedStatement.setString( 3, product.getRegistrationNo() );
			preparedStatement.setString( 4, product.getProductStrength() );
			preparedStatement.setString( 5, product.getProductForm() );
			preparedStatement.setString( 6, product.getProductPackaging() );
			preparedStatement.setString( 7, product.getProductManufacturer() );
			preparedStatement.setString( 8, product.getProductOrigin() );
			preparedStatement.setString( 9, product.getProductDescription() );
			preparedStatement.setString( 10, product.getProductImage() );
			preparedStatement.setBoolean( 11, product.isRXProduct() );
			preparedStatement.setInt( 12, product.getCounterLimit() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
		
	}

	@Override
	public void deleteProduct(int productId) {
		try {
			String query = "DELETE FROM Product where ProductID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, productId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateProduct(Product product) {
		try {
			String query = "UPDATE Product SET ProductName=?, GenericName=?, RegistrationNo=?, ProductStrength=?, ProductForm=?, ProductPackaging=?, ProductManufacturer=?, ProductOrigin=?, ProductDescription=?, ProductImage=?, isRXProduct=?, CounterLimit=? WHERE ProductID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString( 1, product.getProductName() );
			preparedStatement.setString( 2, product.getGenericName() );
			preparedStatement.setString( 3, product.getRegistrationNo() );
			preparedStatement.setString( 4, product.getProductStrength() );
			preparedStatement.setString( 5, product.getProductForm() );
			preparedStatement.setString( 6, product.getProductPackaging() );
			preparedStatement.setString( 7, product.getProductManufacturer() );
			preparedStatement.setString( 8, product.getProductOrigin() );
			preparedStatement.setString( 9, product.getProductDescription() );
			preparedStatement.setString( 10, product.getProductImage() );
			preparedStatement.setBoolean( 11, product.isRXProduct() );
			preparedStatement.setInt( 12, product.getCounterLimit() );
			preparedStatement.setInt( 13, product.getProductID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Product" );
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
				product.setProductImage( new EncryptionFunction().decrypt(resultSet.getString( "ProductImage" )));
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

	@Override
	public Product getProductById(int productId) {
		Product product = new Product();
		try {
			String query = "SELECT * FROM Product WHERE ProductID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, productId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
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
				product.setProductImage( new EncryptionFunction().decrypt(resultSet.getString( "ProductImage" )));
				product.setRXProduct( resultSet.getBoolean( "isRXProduct" ) );
				product.setCounterLimit( resultSet.getInt( "CounterLimit" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

}
