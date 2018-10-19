package thesis.mvc.pageaction;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import thesis.mvc.implement.CityListingImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
import thesis.mvc.utility.DBUtility;

public class ShopAction {
	
	private Connection conn;

	public ShopAction() {
		conn = DBUtility.getConnection();
	}
	
	public String purchaseOrder(Order order, List<OrderDetail> OrderDetails, String HomePage) {
		//Check if order has less than 5 items
		if (OrderDetails.size() > 5) { return null; }
		
		for (OrderDetail orderDetail : OrderDetails) {
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){
				
				stmt.setInt(1,  orderDetail.getProductID() );
				
				int limit;
				boolean rx;
				
				//Check if the quantity of each item in the order is less than the limit
				try(ResultSet rs = stmt.executeQuery()){
					if (rs.next()) {
						limit = rs.getInt("CounterLimit");
						rx = rs.getBoolean("isRXProduct");
						if (orderDetail.getQuantity() > limit || rx == true) {
							return null;
						}
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}		
		
		//Get the city of the customer & senior status
		int CityCustomer = 0;
		boolean SeniorStatus = false;
		String CustoAddress = "Error";
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, order.getCustomerID());
            try(ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
	            	CityCustomer = rs.getInt("CityID");
					SeniorStatus = rs.getBoolean("IsSeniorCitizen");
					CustoAddress = rs.getString("CustomerStreet")
							+ ", " + rs.getString("CustomerBarangay")
							+ ", " + new CityListingImplement().getCityListingById(rs.getInt("CityID")).getCityName()
							+ ", " + rs.getString("CustomerProvince");
				}
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
		
		//Where is the branch located
		int CityPharmacy = -1;
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM branch WHERE CityID = ?")) {
			stmt.setInt(1, CityCustomer);
			try(ResultSet rs = stmt.executeQuery()){
				if (rs.next()) {
					CityPharmacy = rs.getInt("CityID");
				}
			}
		} catch (SQLException e){
			e.printStackTrace();
			return null;
		}
		order.setSeniorDiscount(SeniorStatus);
		order.setOrderAddress(CustoAddress);
		
		//Check if city is equal or not
		Double DeliveryCost;
		if (CityCustomer == CityPharmacy) {
			order.setOrderType("Intercity Regular");
			DeliveryCost = 50.0;
			
		} else {
			order.setOrderType("Intracity Regular");
			DeliveryCost = 100.0;
		}
		
		//Add nessesary information
		Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
		order.setDateOrdered(CurrentDate);
		order.setOrderStatus( "PENDING" );
		
		//Add delivery cost and Input order detail
		Double actualcost = 0.0;
		OrderDetailImplement OrderDet = new OrderDetailImplement();  
		for (OrderDetail orderDetail : OrderDetails) {
			actualcost += orderDetail.getTotalCost();
		}
		actualcost += DeliveryCost;
		order.setActualCost( actualcost );
		
		//Add to order
		int orderID = new OrderImplement().addIncompleteOrder(order);
		//insert OrderID
		for (OrderDetail orderDetail : OrderDetails) {
			orderDetail.setOrderID( orderID );
			OrderDet.addOrderDetail( orderDetail );
		}
		
		return SendOrder(order, OrderDetails, HomePage);
	}
	@SuppressWarnings("unchecked")
	public String SendOrder(Order order, List<OrderDetail> OrderDetails, String HomePage) {
			JSONObject JSONReciept = new JSONObject();
			
	        //totalAmount
	    	JSONObject totalAmount1 = new JSONObject();
	        totalAmount1.put("currency", "PHP");
	        totalAmount1.put("value",  order.getActualCost());
	    		JSONObject details1 = new JSONObject();
	    		details1.put("serviceCharge", 25.0);
	    		details1.put("shippingFee", 25.0);
	    		details1.put("tax", order.getActualCost() * 0.05);
	    		details1.put("subtotal", (order.getActualCost() * 0.95) - 50.0);
	        totalAmount1.put("details", details1);
	    	JSONReciept.put("totalAmount", totalAmount1);
	    	
	    	Customer customer = new Customer();
	    	customer = new CustomerImplement().getCustomerById(order.getCustomerID());
	    	
	    	//buyer
	        JSONObject buyer = new JSONObject();
	        buyer.put("firstName", "Dan");
	        buyer.put("middleName", "Tiu");
	        buyer.put("lastName", "Yu");
	        //Name in DB to be redone
				JSONObject contact = new JSONObject();
				contact.put("email", customer.getEmail());
				contact.put("phone", customer.getCustomerCellular());
		    buyer.put("contact", contact);
		    	JSONObject address = new JSONObject();
		    	address.put("countryCode", "PH");
		    	address.put("state", "Metro Manila");
		    	address.put("city", new CityListingImplement().getCityListingById(customer.getCityID()).getCityName());
		    	address.put("line2", customer.getCustomerBarangay());
		    	address.put("line1", customer.getCustomerStreet());
	        buyer.put("billingAddress", address);
	        buyer.put("shippingAddress", address);
	        buyer.put("ipAddress", "125.60.148.241");
	    	JSONReciept.put("buyer", buyer);
	
	    	//items
	        List<JSONObject> items = new ArrayList<JSONObject>();
	        for (OrderDetail detail : OrderDetails){
	        	JSONObject item = new JSONObject();
	        	Product checkin = new Product();
	        	checkin = new ProductImplement().getProductById(detail.getProductID());
	        	item.put("name", checkin.getProductName());
	        	//item.put("code", detail.getProductID());
	        	item.put("description", checkin.getProductDescription());
	        	item.put("quantity", detail.getQuantity());
	        	JSONObject amount = new JSONObject();
		    		amount.put("value", detail.getCostPerUnit());
		    		amount.put("currency", "PHP");
		        	JSONObject details0 = new JSONObject();
		    			details0.put("tax", detail.getCostPerUnit() * 0.05);
		        		details0.put("subtotal", detail.getCostPerUnit() * 0.95);
		    		amount.put("details", details0);
		    	item.put("amount", amount);
	        	JSONObject totalAmount = new JSONObject();
					totalAmount.put("value", detail.getTotalCost() );
					totalAmount.put("currency", "PHP");
		    		JSONObject details = new JSONObject();
		    			details.put("tax", detail.getTotalCost() * 0.05);
		        		details.put("subtotal", detail.getTotalCost() * 0.95);
					totalAmount.put("details", details);
				item.put("totalAmount", totalAmount);
	        	items.add(item);
	        }
	        JSONReciept.put("items", items);
	        
	    	//redirectUrl
	        JSONObject redirectUrl = new JSONObject();
	        redirectUrl.put("success", HomePage);
	        redirectUrl.put("failure", HomePage);
	        redirectUrl.put("cancel", HomePage);
	        JSONReciept.put("redirectUrl", redirectUrl);
	    	
	        //requestReferenceNumber
	        JSONReciept.put("requestReferenceNumber", "000141386713");
	    	
	    	//metadata
	        JSONObject metadata = new JSONObject();        
	        JSONReciept.put("metadata", metadata);
	        
	        
	        try {
	        	
				URL url = new URL("https://pg-sandbox.paymaya.com/checkout/v1/checkouts");
				HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
				
				//remove if not working
				conn.setDoOutput(true);
				
				conn.setRequestMethod("POST");
				
				//Change if not working
				conn.setRequestProperty("Authorization", "Basic cGstblJPN2NsU2ZKcm9qdVJtU2hxUmJpaEtQTGRHZUNuYjl3aUlXRjhtZUpFOTo=");
				conn.setRequestProperty("Content-Type", "application/json");
				
				//Check later
				byte[] postData = JSONReciept.toString().getBytes("UTF-8");
				
				System.out.println("BODY: " + JSONReciept.toString());
				
				conn.getOutputStream().write(postData);
				
				if (conn.getResponseCode() != 200) {
	
					
					System.out.println("FAILED!"+ conn.getResponseCode());
					
					
					
				} else {
					System.out.println("SUCCESS!" + conn.getResponseCode());
					Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
					StringBuilder sb = new StringBuilder();
	                for (int c; (c = in.read()) >= 0;)
	                    sb.append((char)c);
	                String returnMsg = sb.toString();
	                
	                
	               
	                JSONParser parser = new JSONParser();
	                JSONObject testobject = (JSONObject) parser.parse(returnMsg);
	                System.out.println("RESPONSE"+ conn.getResponseCode() + returnMsg);
	                System.out.println(testobject.get("redirectUrl"));
	                
	                return (String) testobject.get("redirectUrl");
	                
	                
				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			return null;
	}

}