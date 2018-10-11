package thesis.mvc.controller;

import java.awt.font.NumericShaper;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import thesis.mvc.pageaction.PurchaseAction.CartList;
import thesis.mvc.utility.DBUtility;

@WebServlet("/TestController")
@MultipartConfig
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "D:/uploads";
	
    @SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	/*
        JSONObject obj = new JSONObject();
    	
    	
        JSONObject obj1 = new JSONObject();
        
        List<String> myStringlists = Arrays.asList("foo","fie","fat");
        //JSONArray myStringlists = new JSONArray();
        //myStringlists.put("foo");
        //JSONArray.toJSONString()
        obj1.put("name", myStringlists);
        obj1.put("num", new Integer(100));
        obj1.put("balance", new Double(1000.21));
        obj1.put("is_vip", new Boolean(true));
        
        JSONObject obj2 = new JSONObject();

        obj2.put("name", "bar");
        obj2.put("num", new Integer(130));
        obj2.put("balance", new Double(1000.21));
        obj2.put("is_vip", new Boolean(true));
        
        JSONObject obj3 = new JSONObject();

        obj3.put("name", "kat");
        obj3.put("num", new Integer(400));
        obj3.put("balance", new Double(1000.21));
        obj3.put("is_vip", new Boolean(true));
        
        List<JSONObject> full = new ArrayList<JSONObject>();

        full.add(obj1);
        full.add(obj2);
        full.add(obj3);
        
        obj.put("testing", full);
        
    	request.setAttribute("message", obj);
    	*/
    	
    	//This is the final item
    	JSONObject JSONReciept = new JSONObject();

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
        
        //Fixing below
        
        //Unfixed below
        
    	//buyer
        JSONObject buyer = new JSONObject();
        buyer.put("ipAddress", "125.60.148.241");
        	JSONObject address = new JSONObject();
        	address.put("countryCode", "PH");
        	address.put("state", "Metro Manila");
        	address.put("city", "Muntinlupa City");
        	address.put("line2", "Alabang hills village");
        	address.put("line2", "26 Bacolod St.");
        buyer.put("shippingAddress", address);
        buyer.put("billingAddress", address);
    		JSONObject contact = new JSONObject();
    		contact.put("phone", "+(63)1234567890");
    		contact.put("email", "edennyyu@gmail.com");
        buyer.put("contact", contact);
        buyer.put("lastName", "Yu");
        buyer.put("middleName", "Tiu");
        buyer.put("firstName", "Dan");
    	JSONReciept.put("buyer", buyer);
    	
        //totalAmount
    	JSONObject totalAmount1 = new JSONObject();
    		JSONObject details1 = new JSONObject();
    		details1.put("subtotal", 205.90);
    		details1.put("tax", 70.75);
    		details1.put("shippingFee", 23.65);
    		details1.put("serviceCharge", 45.95);
    		details1.put("discount", 15.30);
        totalAmount1.put("details", details1);
        totalAmount1.put("value",  205.90);
        totalAmount1.put("currency", "PHP");
    	JSONReciept.put("totalAmount", totalAmount1);
    	
    	
        
    	//metadata
    		//Leave blank
    	//requestReferenceNumber
    		//ID : OrderNumber
    	//redirectUrl
			//Cancel : String
			//Failure : String
			//Success : String
    	//items
    		//amount : 
    			//details
    				//subtotal : Double (to 2 decimal points)
    				//tax : Double (to 2 decimal points)
					//shippingFee : Double (to 2 decimal points)
					//serviceCharge : Double (to 2 decimal points)
					//discount : Double (to 2 decimal points)
    			//currency : "PHP"
    			//value : Double (to 2 decimal points)
    		//quantity : int
    		//description :String 
    		//code : String
    		//name : String
    	//buyer
    	//totalAmount
    	request.setAttribute("message", JSONReciept);
    	
    	
    	
    	
        request.getRequestDispatcher("/test2.jsp").forward(request, response);
    	/*
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
	            	request.setAttribute("message", "File Uploaded Successfully: " + UPLOAD_DIRECTORY + File.separator + name + "." + imageType);
				} else {
	            	request.setAttribute("message", "File Uploaded is not an image!");
				}
            	
            } catch (Exception ex) {
            	request.setAttribute("message", "File Upload Failed due to " + ex);
            }
            
        }else{
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
    	 */
    }

}