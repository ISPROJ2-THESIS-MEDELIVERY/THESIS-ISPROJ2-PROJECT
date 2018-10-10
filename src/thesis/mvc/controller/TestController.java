package thesis.mvc.controller;

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
    	
    	//This is the final item
    	JSONObject JSONReciept = new JSONObject();
    	
    	//metadata
        JSONObject metadata = new JSONObject();        
        JSONReciept.put("metadata", metadata);
    	
        //requestReferenceNumber
        JSONReciept.put("requestReferenceNumber", "000141386713");
        
    	//redirectUrl
        JSONObject redirectUrl = new JSONObject();
        redirectUrl.put("cancel", "www.google.com");
        redirectUrl.put("failure", "www.google.com");
        redirectUrl.put("success", "www.google.com");
        JSONReciept.put("redirectUrl", redirectUrl);
        
    	//items
        List<JSONObject> items = new ArrayList<JSONObject>();
        //Loop Here		//item		//List<CartList> cartlists = new ArrayList<CartList>();
        	JSONObject item = new JSONObject();
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
        	item.put("name", "itemName");
        	items.add(item);
        //To Here
        JSONReciept.put("items", items);
        
    	//buyer
	    	//ipAddress
	    	//
	    	//
	    	//
	    	//
	    	//
	    	//
    	//totalAmount
    	
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