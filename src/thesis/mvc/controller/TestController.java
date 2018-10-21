package thesis.mvc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/TestController")
@MultipartConfig
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "D:/uploads";
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
				//List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest((RequestContext) request);
				//for(FileItem item : multiparts){
				//    if(!item.isFormField()){
				//        String name = new File(item.getName()).getName();
				//        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
				//    }
				//}//File uploaded successfully
            	//Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
				//InputStream filecontent = filePart.getInputStream();
				//String name = filePart.getName();//new File(filePart.getName()).getName();
				//String end = filePart.getContentType();
				//filePart.write(UPLOAD_DIRECTORY + File.separator + name + "." + end);
            	//request.setAttribute("message", "File Uploaded Successfully " + name + end);

            	Part filePart = request.getPart("file");
				String name = "Prescription" + 1;
				//String end = filePart.getContentType();
				String end = filePart.getContentType();
				if (end.startsWith("image")) {
					String imageType = end.replace("image/", "");
					filePart.write(UPLOAD_DIRECTORY + File.separator + name + "." + imageType);
	            	request.setAttribute("message", "File Uploaded Successfully: " + UPLOAD_DIRECTORY + File.separator + name + "." + imageType + "<br> ");
				} else {
	            	request.setAttribute("message", "File Uploaded is not an image!");
				}
            	
            } catch (Exception ex) {
            	request.setAttribute("message", "File Upload Failed due to " + ex);
            }
            
        }else{
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
        request.getRequestDispatcher("/test2.jsp").forward(request, response);
    }
    
    @SuppressWarnings("unchecked")
	public static void main (String args[]) {
    	
    	JSONObject JSONReciept = new JSONObject();
    	
        //totalAmount
    	JSONObject totalAmount1 = new JSONObject();
        totalAmount1.put("currency", "PHP");
        totalAmount1.put("value",  205.90);
    		JSONObject details1 = new JSONObject();
    		details1.put("discount", 15.30);
    		details1.put("serviceCharge", 45.95);
    		details1.put("shippingFee", 23.65);
    		details1.put("tax", 70.75);
    		details1.put("subtotal", 205.90);
        totalAmount1.put("details", details1);
    	JSONReciept.put("totalAmount", totalAmount1);
    	
    	//buyer
        JSONObject buyer = new JSONObject();
        buyer.put("firstName", "Dan");
        buyer.put("middleName", "Tiu");
        buyer.put("lastName", "Yu");
    	JSONReciept.put("buyer", buyer);
			JSONObject contact = new JSONObject();
			contact.put("email", "edennyyu@gmail.com");
			contact.put("phone", "+(63)1234567890");
	    buyer.put("contact", contact);
	    	JSONObject address = new JSONObject();
	    	address.put("countryCode", "PH");
	    	address.put("state", "Metro Manila");
	    	address.put("city", "Muntinlupa City");
	    	address.put("line2", "Alabang hills village");
	    	address.put("line2", "26 Bacolod St.");
        buyer.put("billingAddress", address);
        buyer.put("shippingAddress", address);
        buyer.put("ipAddress", "125.60.148.241");

    	//items
        List<JSONObject> items = new ArrayList<JSONObject>();
        //foreach(){
        	JSONObject item = new JSONObject();
        	item.put("name", "ProductName");
        	item.put("code", "ProductCode/ID/Pharma Number");
        	item.put("description", "productInfo");
        	item.put("quantity", 1);
        	JSONObject amount = new JSONObject();
	    		amount.put("value", 205.90);
	    		amount.put("currency", "PHP");
	        	JSONObject details0 = new JSONObject();
		        	details0.put("discount", 15.30);
	    			details0.put("serviceCharge", 45.95);
	    			details0.put("shippingFee", 23.65);
	    			details0.put("tax", 70.75);
	        		details0.put("subtotal", 50.25);
	    		amount.put("details", details0);
	    	item.put("amount", amount);
        	JSONObject totalAmount = new JSONObject();
				totalAmount.put("value", 205.90);
				totalAmount.put("currency", "PHP");
	    		JSONObject details = new JSONObject();
					details.put("discount", 15.30);
					details.put("serviceCharge", 45.95);
					details.put("shippingFee", 23.65);
					details.put("tax", 70.75);
					details.put("subtotal", 50.25);
				totalAmount.put("details", details);
			item.put("totalAmount", totalAmount);
        	items.add(item);
        //}
        JSONReciept.put("items", items);
        
    	//redirectUrl
        JSONObject redirectUrl = new JSONObject();
        redirectUrl.put("success", "www.google.com");
        redirectUrl.put("failure", "www.google.com");
        redirectUrl.put("cancel", "www.google.com");
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
                JSONReciept.get("redirectURL");
                System.out.println("RESPONSE"+ conn.getResponseCode() + returnMsg);
                System.out.println(testobject.get("redirectUrl"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}