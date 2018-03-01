package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import thesis.mvc.dataobjects.StocksPriceDAO;
import thesis.mvc.model.StocksPrice;
import thesis.mvc.utility.DBUtility;

public class StocksPriceImplement implements StocksPriceDAO{
	
	private Connection conn;

	public StocksPriceImplement() {
		conn = DBUtility.getConnection();
	}

	@Override
	public void addStocksPrice(StocksPrice stocksPrice) {
		try {
			String query = "INSERT INTO StocksPrice (StockID, PriceSet, DateSet, IsCurrent) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocksPrice.getStockID() );
			preparedStatement.setDouble( 2, stocksPrice.getPriceSet() );
			preparedStatement.setDate( 3, stocksPrice.getDateSet() );
			preparedStatement.setBoolean( 4, stocksPrice.isIsCurrent() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}

	@Override
	public void deleteStocksPrice(int stocksPriceId) {
		try {
			String query = "DELETE FROM StocksPrice where StocksPriceID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, stocksPriceId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateStocksPrice(StocksPrice stocksPrice) {
		try {
			String query = "UPDATE StocksPrice SET StockID=?, PriceSet=?, DateSet=?, IsCurrent=? WHERE StocksPriceID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocksPrice.getStockID() );
			preparedStatement.setDouble( 2, stocksPrice.getPriceSet() );
			preparedStatement.setDate( 3, stocksPrice.getDateSet() );
			preparedStatement.setBoolean( 4, stocksPrice.isIsCurrent() );
			preparedStatement.setInt( 5, stocksPrice.getStocksPriceID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<StocksPrice> getAllStocksPrice() {
		List<StocksPrice> stocksPrices = new ArrayList<StocksPrice>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM StocksPrice" );
			while( resultSet.next() ) {
				StocksPrice stocksPrice = new StocksPrice();
				stocksPrice.setStocksPriceID( resultSet.getInt( "StocksPriceID" ) );
				stocksPrice.setStockID( resultSet.getInt( "StockID" ) );
				stocksPrice.setPriceSet( resultSet.getDouble( "PriceSet" ) );
				stocksPrice.setDateSet( resultSet.getDate( "DateSet" ) );
				stocksPrice.setIsCurrent( resultSet.getBoolean( "IsCurrent" ) );
				stocksPrices.add(stocksPrice);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stocksPrices;

	}

	@Override
	public StocksPrice getStocksPricebyId(int stocksPriceId) {
		StocksPrice stocksPrice = new StocksPrice();
		try {
			String query = "SELECT * FROM StocksPrice WHERE StocksPriceID=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, stocksPriceId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				stocksPrice.setStocksPriceID( resultSet.getInt( "StocksPriceID" ) );
				stocksPrice.setStockID( resultSet.getInt( "StockID" ) );
				stocksPrice.setPriceSet( resultSet.getDouble( "PriceSet" ) );
				stocksPrice.setDateSet( resultSet.getDate( "DateSet" ) );
				stocksPrice.setIsCurrent( resultSet.getBoolean( "IsCurrent" ) );
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stocksPrice;
	}

}
