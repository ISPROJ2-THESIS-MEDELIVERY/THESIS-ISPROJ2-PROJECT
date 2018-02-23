package thesis.mvc.implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
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
			String query = "INSERT INTO Stocks (ProductID, BranchID, Quantity, Feature) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, stocks.getProductID() );
			preparedStatement.setInt( 2, stocks.getBranchID() );
			preparedStatement.setInt( 3, stocks.getQuantity() );
			preparedStatement.setBoolean( 4, stocks.isFeature() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO Audit (UserID, LogType, Timestamp, ActionTaken) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt( 1, 3 ); //3 is a placeholder
			preparedStatement.setString( 2, "create, update or delete" ); //placeholder
			preparedStatement.setDate( 3, CurrentDate );
			preparedStatement.setString( 4, "User with ID " + stocks.getProductID() );
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
			String query = "UPDATE Stocks SET ProductID=?, BranchID=?, Quantity=?, Feature=? WHERE StockID=?";
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
				ResultSet resultSet = statement.executeQuery( "SELECT * FROM Stocks" );
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
				String query = "SELECT * FROM Stocks WHERE StockID=?";
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
