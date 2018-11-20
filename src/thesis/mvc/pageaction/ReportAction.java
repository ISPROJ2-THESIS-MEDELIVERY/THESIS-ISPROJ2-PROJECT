package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.pageaction.SearchAction.ProductList;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.EncryptionFunction;

public class ReportAction {
	
	private Connection conn;

	public ReportAction() {
		conn = DBUtility.getConnection();
	}
	public class ProductList {
		private int ProductID;
		private String ProductName;
		private String GenericName;
	}

	public List<ProductList> GeneralListing(int PharmacyID) {
		conn = DBUtility.getConnection();
		List<ProductList> productLists = new ArrayList<ProductList>();
		try {
			Statement statement = conn.createStatement();
			String Query = "SELECT product.ProductID, product.ProductName, product.GenericName, product.ProductStrength, product.ProductForm, product.ProductPackaging, product.ProductDescription, product.ProductImage, product.isRXProduct, stocksprice.PriceSet FROM stocks INNER JOIN stocksprice ON stocksprice.StockID = stocks.StockID INNER JOIN product ON stocks.ProductID = product.ProductID WHERE stocksprice.IsCurrent = 1 AND stocks.PharmacyID = ?";
			PreparedStatement preparedStatement = conn.prepareStatement( Query );
			preparedStatement.setInt( 1, PharmacyID );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() ) {
				ProductList productList = new ProductList();
				productList.setProductID( resultSet.getInt(1) );
				productList.setProductName( resultSet.getString(2) );
				productList.setGenericName( resultSet.getString(3) );
				productList.setProductStrength( resultSet.getString(4) );
				productList.setProductForm( resultSet.getString(5) );
				productList.setProductPackaging( resultSet.getString(6) );
				productList.setProductDescription( resultSet.getString(7) );
				productList.setProductImage( new EncryptionFunction().decrypt( resultSet.getString(8) ) );
				productList.setIsRXProduct( resultSet.getBoolean(9) );
				productList.setPriceSet( resultSet.getDouble(10) );
				productLists.add(productList);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productLists;
	}
}
