package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
	public class ReportList {
		private String ProductName;
		private String GenericName;
		private String RegistrationNo;
		private int Quantity;
		private Double TotalSales;
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
		public String getRegistrationNo() {
			return RegistrationNo;
		}
		public void setRegistrationNo(String registrationNo) {
			RegistrationNo = registrationNo;
		}
		public int getQuantity() {
			return Quantity;
		}
		public void setQuantity(int quantity) {
			Quantity = quantity;
		}
		public Double getTotalSales() {
			return TotalSales;
		}
		public void setTotalSales(Double totalSales) {
			TotalSales = totalSales;
		}
	}

	public List<ReportList> GeneralListing(int BranchID) {
		conn = DBUtility.getConnection();
		List<ReportList> reportLists = new ArrayList<ReportList>();
		try {
			Statement statement = conn.createStatement();
			String Query = "Select Distinct product.ProductName, product.GenericName,   product.RegistrationNo, Sum(Distinct orderdetail.TotalCost) As Sum_TotalCost,   Sum(Distinct orderdetail.Quantity) As Sum_Quantity From `order`,   orderdetail,   product Where orderdetail.OrderID = `order`.OrderID And product.ProductID =   orderdetail.ProductID And `order`.BranchID = ? And   `order`.OrderStatus Like 'COMPLETED%' Group By product.ProductName,   product.GenericName, product.RegistrationNo, `order`.BranchID,   `order`.OrderStatus";
			PreparedStatement preparedStatement = conn.prepareStatement( Query );
			preparedStatement.setInt( 1, BranchID );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() ) {
				ReportList reportList = new ReportList();
				reportList.setProductName(resultSet.getString(1));
				reportList.setGenericName(resultSet.getString(2));
				reportList.setRegistrationNo(resultSet.getString(3));
				reportList.setTotalSales(resultSet.getDouble(4));
				reportList.setQuantity(resultSet.getInt(5));
				reportLists.add(reportList);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reportLists;
	}
}
