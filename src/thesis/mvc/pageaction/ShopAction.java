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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import thesis.mvc.implement.AuditImplement;
import thesis.mvc.implement.CityListingImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.LoginImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Audit;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Login;
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
		//if (OrderDetails.size() > 5) { return null; }
		/*
		for (OrderDetail orderDetail : OrderDetails) {
			try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product WHERE ProductID = ?")){
				
				stmt.setInt(1,  orderDetail.getProductID() );
				
				int limit;
				boolean rx;
				
				//Check if the quantity of each item in the order is less than the limit
				try(ResultSet rs = stmt.executeQuery()){
					if (rs.next()) {
						limit = rs.getInt("CounterLimit");
						//rx = rs.getBoolean("isRXProduct");
						if (orderDetail.getQuantity() > limit) {// || rx == true
							return null;
						}
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		*/		

		//Get the city of the customer & senior status
		boolean SeniorStatus = false;
		String CustoAddress = "Error";
		try(PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE CustomerID = ?")) {
            stmt.setInt(1, order.getCustomerID());
            try(ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
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
		
		order.setSeniorDiscount(SeniorStatus);
		order.setOrderAddress(CustoAddress);
		
		//Check if is prescription
		Double DeliveryCost = 50.0;
		if (order.getPrescriptionID() == 0) {
			order.setOrderType("Regular");
		} else {
			order.setOrderType("Prescription");
		}
		
		//Add nessesary information
		order.setOrderStatus( "PENDING1" );
		
		//Add delivery cost and Input order detail
		Double actualcost = 0.0;
		OrderDetailImplement OrderDet = new OrderDetailImplement();  
		for (OrderDetail orderDetail : OrderDetails) {
			actualcost += orderDetail.getTotalCost();
		}
		actualcost += DeliveryCost;
		
		if (order.getSeniorDiscount() == true) {
			actualcost *= 0.80;
		}
		
		order.setActualCost( actualcost );
		
		//Add to order
		//int orderID = new OrderImplement().addIncompleteOrder(order);
		int orderID = new OrderImplement().addOrder(order);
		order.setOrderID(orderID);
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
	    		if (order.getSeniorDiscount() == true) {
		    		details1.put("discount", order.getActualCost() * 0.25);
	    		}
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

	                order = new OrderImplement().getOrderById(order.getOrderID());
	                order.setPaymayaID((String) testobject.get("checkoutId"));
	                new OrderImplement().updateOrder(order);

	                //Audit Log
	                Timestamp CurrentDate = new Timestamp(Calendar.getInstance().getTime().getTime());
	                Audit audit = new Audit();
	                audit.setUserID(order.getCustomerID());
	                audit.setLogType("Transaction");
	                audit.setTimestamp(CurrentDate);
	                audit.setActionTaken("User ID "
	                + new CustomerImplement().getCustomerById(order.getCustomerID()).getUserID()
	                + " With the Name "
	                + new CustomerImplement().getCustomerById(order.getCustomerID()).getCustomerName()
	                + " made an order. With order ID: " + order.getOrderID());
	                AuditImplement AuditImp = new AuditImplement();
	                AuditImp.addAudit(audit);
	                
	                
	                
	                
	                return (String) testobject.get("redirectUrl");
	                
	                
				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println(e);
				return null;
			}
			return null;
	}

	@SuppressWarnings("unchecked")
	public Boolean RefundOrder(Order order, String Reason) {
		JSONObject JSONCancel = new JSONObject();
		JSONCancel.put("reason", Reason);
		try {
			URL url = new URL("https://pg-sandbox.paymaya.com/checkout/v1/checkouts/" + order.getPaymayaID());
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			//remove if not working
			conn.setDoOutput(true);
			conn.setRequestMethod("DELETE");
			//Change if not working
			conn.setRequestProperty("Authorization", "Basic c2stalpLMGk4eVozMHBoOHhRU1dsTnNGOUFNV2ZHT2QzQmF4SmpRMkNEQ0NaYjo=");
			conn.setRequestProperty("Content-Type", "application/json");
			
			//Check later
			byte[] postData = JSONCancel.toString().getBytes("UTF-8");
			System.out.println("BODY: " + JSONCancel.toString());
			conn.getOutputStream().write(postData);
			
			if (conn.getResponseCode() != 200) {
				System.out.println("FAILED!"+ conn.getResponseCode());
				JSONObject JSONRefund = new JSONObject();
				JSONRefund.put("reason", Reason);
					JSONObject JSONAmmount = new JSONObject();
					JSONAmmount.put("currency", "PHP");
					JSONAmmount.put("value", order.getActualCost());
				JSONRefund.put("amount", JSONAmmount);
				try {
					URL url1 = new URL("https://pg-sandbox.paymaya.com/checkout/v1/checkouts/" + order.getPaymayaID() + "/refunds");
					HttpsURLConnection connRE = (HttpsURLConnection) url1.openConnection();
					//remove if not working
					connRE.setDoOutput(true);
					connRE.setRequestMethod("POST");
					//Change if not working
					connRE.setRequestProperty("Authorization", "Basic c2stalpLMGk4eVozMHBoOHhRU1dsTnNGOUFNV2ZHT2QzQmF4SmpRMkNEQ0NaYjo=");
					connRE.setRequestProperty("Content-Type", "application/json");
					
					//Check later
					byte[] postData1 = JSONRefund.toString().getBytes("UTF-8");
					System.out.println("BODY: " + JSONRefund.toString());
					connRE.getOutputStream().write(postData1);
					
					if (connRE.getResponseCode() != 200) {
						System.out.println("FAILED!"+ connRE.getResponseCode());
						return false;
					} else {
						System.out.println("SUCCESS!" + connRE.getResponseCode());
						Reader in = new BufferedReader(new InputStreamReader(connRE.getInputStream(), "UTF-8"));
						StringBuilder sb = new StringBuilder();
		                for (int c; (c = in.read()) >= 0;)
		                    sb.append((char)c);
		                String returnMsg = sb.toString();
		                
		                
		                JSONParser parser = new JSONParser();
		                JSONObject testobject = (JSONObject) parser.parse(returnMsg);
		                System.out.println("RESPONSE"+ connRE.getResponseCode() + returnMsg);
		                System.out.println(testobject.get("voidStatus"));
		    			return true;

		                /*
		                order = new OrderImplement().getOrderById(order.getOrderID());
		                order.setPaymayaID((String) testobject.get("checkoutId"));
		                new OrderImplement().updateOrder(order);
		                return (String) testobject.get("redirectUrl");
		                */
		                
					}
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e);
					return false;
				}
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
                System.out.println(testobject.get("voidStatus"));
    			return true;

                /*
                order = new OrderImplement().getOrderById(order.getOrderID());
                order.setPaymayaID((String) testobject.get("checkoutId"));
                new OrderImplement().updateOrder(order);
                return (String) testobject.get("redirectUrl");
                */
                
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			return false;
		}
	}

	public boolean CheckOrder(Order order) {	        
	        try {
				URL url = new URL("https://pg-sandbox.paymaya.com/checkout/v1/checkouts/" + order.getPaymayaID());
				HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
				conn.setDoOutput(true);
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "Basic c2stalpLMGk4eVozMHBoOHhRU1dsTnNGOUFNV2ZHT2QzQmF4SmpRMkNEQ0NaYjo=");
				conn.setRequestProperty("Content-Type", "application/json");
				
				if (conn.getResponseCode() != 200) {
					System.out.println("FAILED!"+ conn.getResponseCode());
					return false;
				} else {
					System.out.println("SUCCESS!" + conn.getResponseCode());
					return true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				return false;
			}
	}

}
