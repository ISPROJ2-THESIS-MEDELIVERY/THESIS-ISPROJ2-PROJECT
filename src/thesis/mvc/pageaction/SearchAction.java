package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	public class ProductList {
		private String ProductName;
		private String GenericName;
		private String ProductStrength;
		private String ProductForm;
		private String ProductPackaging;
		private String ProductDescription;
		private String ProductImage;
		private String Quantity;
		private double PriceSet;
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public String getGenericName() {
			return GenericName;
		}
		public void setGenericName(String genericName) {
			GenericName = genericName;
		}
		public String getProductStrength() {
			return ProductStrength;
		}
		public void setProductStrength(String productStrength) {
			ProductStrength = productStrength;
		}
		public String getProductForm() {
			return ProductForm;
		}
		public void setProductForm(String productForm) {
			ProductForm = productForm;
		}
		public String getProductPackaging() {
			return ProductPackaging;
		}
		public void setProductPackaging(String productPackaging) {
			ProductPackaging = productPackaging;
		}
		public String getProductDescription() {
			return ProductDescription;
		}
		public void setProductDescription(String productDescription) {
			ProductDescription = productDescription;
		}
		public String getProductImage() {
			return ProductImage;
		}
		public void setProductImage(String productImage) {
			ProductImage = productImage;
		}
		public String getQuantity() {
			return Quantity;
		}
		public void setQuantity(String quantity) {
			Quantity = quantity;
		}
		public double getPriceSet() {
			return PriceSet;
		}
		public void setPriceSet(double priceSet) {
			PriceSet = priceSet;
		}
	}
	
	public ProductList GeneralListing(int BranchID) {
		conn = DBUtility.getConnection();
		ProductList productList = new ProductList();
		try {
			Statement statement = conn.createStatemen0ductName, product.GenericName, product.ProductStrength, product.ProductForm, product.ProductPackaging, product.ProductDescription, product.ProductImage, stocks.Quantity, stocksprice.PriceSet FROM stocks INNER JOIN stocksprice ON stocksprice.StockID = stocks.StockID INNER JOIN product ON stocks.ProductID = product.ProductID WHERE stocksprice.IsCurrent = 1 AND stocks.BranchID = ?";
			PreparedStatement preparedStatement = conn.prepareStatement( Query );
			preparedStatement.setInt( 1, BranchID );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() ) {
				productList.setProductName( resultSet.getString(1) );
				productList.setGenericName( resultSet.getString(2) );
				productList.setProductStrength( resultSet.getString(3) );
				productList.setProductForm( resultSet.getString(4) );
				productList.setProductPackaging( resultSet.getString(5) );
				productList.setProductDescription( resultSet.getString(6) );
				productList.setProductImage( resultSet.getString(7) );
				productList.setQuantity( resultSet.getString(8) );
				productList.setPriceSet( resultSet.getDouble(9) );
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public List<Product> ProductListing(String searchQuerty, int searchFilter) {
		conn = DBUtility.getConnection();
		String Query = "SELECT * FROM Product";
		if(searchFilter == 1){
			Query +=" ORDER BY ProductName DESC WHERE ProductName LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 2){
			Query += " ORDER BY GenericName DESC WHERE GenericName LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 3){
			Query += " ORDER BY RegistrationNumber DESC WHERE RegistrationNumber LIKE '%" + searchQuerty + "%'";
		}
		else if(searchFilter == 4){
			Query += " ORDER BY CounterLimit DESC WHERE CounterLimit LIKE '%" + searchQuerty + "%'";
		}
		else {
			Query += "SELECT * FROM Product"
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
