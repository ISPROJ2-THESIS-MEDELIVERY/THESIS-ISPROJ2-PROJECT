package thesis.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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


import thesis.mvc.utility.DBUtility;

@WebServlet("/TestController")
@MultipartConfig
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "D:/uploads";
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
            	/*
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest((RequestContext) request);
				for(FileItem item : multiparts){
				    if(!item.isFormField()){
				        String name = new File(item.getName()).getName();
				        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
				    }
				}//File uploaded successfully
				*/
            	Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
				InputStream filecontent = filePart.getInputStream();
				String name = filePart.getName();//new File(filePart.getName()).getName();
				String end = filePart.getContentType();
				filePart.write(UPLOAD_DIRECTORY + File.separator + name + "." + end);
            	request.setAttribute("message", "File Uploaded Successfully " + name + end);
            } catch (Exception ex) {
            	request.setAttribute("message", "File Upload Failed due to " + ex);
            }
            
        }else{
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
        request.getRequestDispatcher("/test2.jsp").forward(request, response);
    }

}