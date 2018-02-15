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
	public void addStocks(Stocks stocks) {
		try {
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocks.getProductID() );
			preparedStatement.setInt( 2, stocks.getBranchID() );
			preparedStatement.setInt( 3, stocks.getQuantity() );
			preparedStatement.setBoolean( 4, stocks.isFeature() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteStocks(int stocksId) {
		try {
			String query = "";
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
			String query = "";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocks.getProductID() );
			preparedStatement.setInt( 2, stocks.getBranchID() );
			preparedStatement.setInt( 3, stocks.getQuantity() );
			preparedStatement.setBoolean( 4, stocks.isFeature() );
			preparedStatement.setInt( 5, stocks.getStockID() );
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
				ResultSet resultSet = statement.executeQuery( "" );
				while( resultSet.next() ) {
					Stocks stock = new Stocks();
					stock.setStockID( resultSet.getInt( "StockID" ) );
					stock.setProductID( resultSet.getInt( "ProductID" ) );
					stock.setBranchID( resultSet.getInt( "BranchID" ) );
					stock.setQuantity( resultSet.getInt( "Quantity" ) );
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
				String query = "";
				PreparedStatement preparedStatement = conn.prepareStatement( query );
				preparedStatement.setInt(1, stocksId);
				ResultSet resultSet = preparedStatement.executeQuery();
				while( resultSet.next() ) {
					stock.setStockID( resultSet.getInt( "StockID" ) );
					stock.setProductID( resultSet.getInt( "ProductID" ) );
					stock.setBranchID( resultSet.getInt( "BranchID" ) );
					stock.setQuantity( resultSet.getInt( "Quantity" ) );
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
