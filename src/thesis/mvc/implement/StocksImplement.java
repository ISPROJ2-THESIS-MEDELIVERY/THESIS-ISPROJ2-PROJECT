package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.StocksDAO;
import thesis.mvc.model.Stocks;
import thesis.mvc.utility.DBUtility;

public class StocksImplement implements StocksDAO{
	
	private Connection conn;

	public StocksImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public int addStocks(Stocks stocks) {
		try {
			String query = "INSERT INTO Stocks (ProductID, PharmacyID, Feature) VALUES (?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocks.getProductID() );
			preparedStatement.setInt( 2, stocks.getPharmacyID() );
			preparedStatement.setBoolean( 3, stocks.isFeature() );
			int NewID = preparedStatement.executeUpdate();
			preparedStatement.close();
			return NewID;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} 
		
	}

	@Override
	public void deleteStocks(int stocksId) {
		try {
			String query = "DELETE FROM Stocks where StockID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, stocksId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateStocks(Stocks stocks) {
		try {
			String query = "UPDATE Stocks SET ProductID=?, PharmacyID=?, Feature=? WHERE StockID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocks.getProductID() );
			preparedStatement.setInt( 2, stocks.getPharmacyID() );
			preparedStatement.setBoolean( 3, stocks.isFeature() );
			preparedStatement.setInt( 4, stocks.getStockID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Stocks> getAllStocks() {
		List<Stocks> stocks = new ArrayList<Stocks>();
			try {
				Statement statement = conn.createStatement();
				ResultSet resultSet = statement.executeQuery( "SELECT * FROM Stocks" );
				while( resultSet.next() ) {
					Stocks stock = new Stocks();
					stock.setStockID( resultSet.getInt( "StockID" ) );
					stock.setProductID( resultSet.getInt( "ProductID" ) );
					stock.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
					stock.setFeature( resultSet.getBoolean( "Feature" ) );
					stocks.add(stock);
				}
				resultSet.close();
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return stocks;
	}

	@Override
	public Stocks getStocksById(int stocksId) {
		Stocks stock = new Stocks();
			try {
				String query = "SELECT * FROM Stocks WHERE StockID=?";
				PreparedStatement preparedStatement = conn.prepareStatement( query );
				preparedStatement.setInt(1, stocksId);
				ResultSet resultSet = preparedStatement.executeQuery();
				while( resultSet.next() ) {
					stock.setStockID( resultSet.getInt( "StockID" ) );
					stock.setProductID( resultSet.getInt( "ProductID" ) );
					stock.setPharmacyID( resultSet.getInt( "PharmacyID" ) );
					stock.setFeature( resultSet.getBoolean( "Feature" ) );
				}
				resultSet.close();
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return stock;
	}

}
