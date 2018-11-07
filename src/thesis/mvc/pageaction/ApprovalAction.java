package thesis.mvc.pageaction;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.SendEmail;

public class ApprovalAction {
	private Connection conn;

	public ApprovalAction() {
		conn = DBUtility.getConnection();
	}
	
	//List the the products
	public List<Product> getProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery( "SELECT * FROM Product WHERE isRXProduct = 0" );
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
	
	//Add city in order to 
	public class PharmaOrder {
		private int OrderID;
		private String CustomerInfo;//CustomerID;
		private String CityName;//CityID;
		private int PrescriptionID;
		private String OrderAddress;
		private Date DateOrdered;
		private String OrderStatus;
		private Boolean SeniorDiscount;
		private String orderDetails;//Order List
		private double ActualCost;
		public int getOrderID() {
			return OrderID;
		}
		public void setOrderID(int orderID) {
			OrderID = orderID;
		}
		public String getCustomerInfo() {
			return CustomerInfo;
		}
		public void setCustomerInfo(String customerInfo) {
			CustomerInfo = customerInfo;
		}
		public String getCityName() {
			return CityName;
		}
		public void setCityName(String cityName) {
			CityName = cityName;
		}
		public int getPrescriptionID() {
			return PrescriptionID;
		}
		public void setPrescriptionID(int prescriptionID) {
			PrescriptionID = prescriptionID;
		}
		public String getOrderAddress() {
			return OrderAddress;
		}
		public void setOrderAddress(String orderAddress) {
			OrderAddress = orderAddress;
		}
		public Date getDateOrdered() {
			return DateOrdered;
		}
		public void setDateOrdered(Date dateOrdered) {
			DateOrdered = dateOrdered;
		}
		public String getOrderStatus() {
			return OrderStatus;
		}
		public void setOrderStatus(String orderStatus) {
			OrderStatus = orderStatus;
		}
		public Boolean getSeniorDiscount() {
			return SeniorDiscount;
		}
		public void setSeniorDiscount(Boolean seniorDiscount) {
			SeniorDiscount = seniorDiscount;
		}
		public String getOrderDetails() {
			return orderDetails;
		}
		public void setOrderDetails(String orderDetails) {
			this.orderDetails = orderDetails;
		}
		public double getActualCost() {
			return ActualCost;
		}
		public void setActualCost(double actualCost) {
			ActualCost = actualCost;
		}
	}
	public List<PharmaOrder> getRegularOrder(int BranchID) {
		List<PharmaOrder> PharmaOrders = new ArrayList<PharmaOrder>();
		
		//String Hold = "Select `order`.* From `order` Inner Join customer On `order`.CustomerID = customer.CustomerID Inner Join citylisting On customer.CityID = citylisting.CityID, branch Where `order`.CityID = branch.CityID And `order`.OrderStatus = 'PENDING' And branch.BranchID = ?";
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM `order` WHERE OrderStatus = 'PENDING' AND BranchID = ?")) {
	        stmt.setInt(1, BranchID);
	        try(ResultSet resultSet = stmt.executeQuery()) {
	        	while( resultSet.next() ) {
					PharmaOrder pharmaOrder = new PharmaOrder();
					//Order ID
					pharmaOrder.setOrderID(resultSet.getInt("OrderID"));
					//Customer Information
					String CustomerInfo = "";
					PreparedStatement preparedStatement = conn.prepareStatement( "SELECT customer.CustomerName, customer.Address, customer.Email, customer.ContactNumber FROM customer where CustomerID = ?" );
					preparedStatement.setInt(1, resultSet.getInt("CustomerID"));
					ResultSet resultSet1 = preparedStatement.executeQuery();
					while( resultSet1.next() ) {
						CustomerInfo = resultSet1.getString(1) + " | " + resultSet1.getString(2)  + " | " + resultSet1.getString(3)  + " | " + resultSet1.getString(4);
					}
					resultSet1.close();
					pharmaOrder.setCustomerInfo(CustomerInfo);
					preparedStatement.close();
					//City Name
					pharmaOrder.setCityName(resultSet.getString("CityID"));
					//Order Address
					pharmaOrder.setOrderAddress(resultSet.getString("OrderAddress"));
					//Date Ordered
					pharmaOrder.setDateOrdered(resultSet.getDate("DateOrdered"));
					//Order Status
					pharmaOrder.setOrderStatus(resultSet.getString("OrderStatus"));
					//Senior Discount
					pharmaOrder.setSeniorDiscount(resultSet.getBoolean("SeniorDiscount"));
					//Order Details
					String OrderInfo = "<br>";
					PreparedStatement preparedStatement1 = conn.prepareStatement( "SELECT product.ProductName, orderdetail.Quantity FROM orderdetail INNER JOIN product ON orderdetail.ProductID = product.ProductID WHERE orderdetail.OrderID = ?" );
					preparedStatement1.setInt(1, resultSet.getInt("OrderID"));
					ResultSet resultSet2 = preparedStatement1.executeQuery();
					while( resultSet2.next() ) {
						OrderInfo += resultSet2.getString(1) + "<br>" + resultSet2.getString(2) + "<br><br>";
					}
					resultSet2.close();
					pharmaOrder.setOrderDetails(OrderInfo);
					preparedStatement1.close();
					//Actual Cost 
					pharmaOrder.setActualCost(resultSet.getDouble("ActualCost"));
									
					
					PharmaOrders.add(pharmaOrder);
				}
	        }
	        return PharmaOrders;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void pharmacistApproval(int orderID, int aprroval) {
		Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
		if (aprroval == 1) {
			Order order = new OrderImplement().getOrderById(orderID);
			int repeat = Integer.valueOf(order.getOrderStatus().substring(order.getOrderStatus().length() - 1));
			
			if (order.getOrderStatus().equalsIgnoreCase("PENDING5")) {
				try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = ?, BranchID = 0 WHERE OrderID = ?")) {
					stmt.setString(1, "CANCELLED");
					stmt.setInt(2, orderID);
					stmt.executeUpdate();
					stmt.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
				new SendEmail().send(new CustomerImplement().getCustomerById(order.getCustomerID()).getEmail(), "Transaction Cancelled on " + CurrentDate + " Due to too many rejections", new SendEmail().OrderEmail(order));
				new ShopAction().RefundOrder(order, "Customer Cancelled the order");
			} else {
				try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = ?, BranchID = 0 WHERE OrderID = ?")) {
					stmt.setString(1, "PENDING" + (repeat + 1));
					stmt.setInt(2, orderID);
					stmt.executeUpdate();
					stmt.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
			}
			
		} else if (aprroval == 2) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'EN-ROUTE', DateProcessed = ? WHERE OrderID = ?")) {
				stmt.setTimestamp(1, CurrentDate);
				stmt.setInt(2, orderID);
	            stmt.executeUpdate();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		} else if (aprroval == 3) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'INVALID', DateProcessed = ? WHERE OrderID = ?")) {
				stmt.setTimestamp(1, CurrentDate);
				stmt.setInt(2, orderID);
	            stmt.executeUpdate();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		} else if (aprroval == 4) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'COMPLETED-REJECTED-RETURN' WHERE OrderID = ?")) {
				stmt.setInt(1, orderID);
	            stmt.executeUpdate();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		} else if (aprroval == 5) {
			try(PreparedStatement stmt = conn.prepareStatement("UPDATE `order` SET OrderStatus = 'RETURNING' WHERE OrderID = ?")) {
				stmt.setInt(1, orderID);
	            stmt.executeUpdate();
	            stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
	}
	
}
