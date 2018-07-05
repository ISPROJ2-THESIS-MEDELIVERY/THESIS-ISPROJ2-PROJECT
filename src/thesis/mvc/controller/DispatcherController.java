package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.manager.DummyProxySession;

import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.pageaction.DispatcherAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/DispatcherController")
public class DispatcherController extends HttpServlet{
	
	private Connection conn;

	public DispatcherController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
    	int AccessLevel = (int) session.getAttribute("userAccess");
		String forward = "";
    	if (AccessLevel == 2) {
    		forward = "/DeliveryPersonel.jsp";
    		//Insert needed things here
    		DriverImplement driverImplement = new DriverImplement();
        	DispatcherAction dispatcherAction = new DispatcherAction();
    		session.setAttribute("DriverList", driverImplement.getAllDrivers() );
    		session.setAttribute("OrderList", dispatcherAction.getapprovedOrder() );
    		RequestDispatcher view = request.getRequestDispatcher( forward );
    		view.forward(request, response);
    	} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
    	}
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
    	int OrderID = Integer.parseInt( request.getParameter( "OrderID" ) );
    	int DriverID = Integer.parseInt( request.getParameter( "DriverID" ) );
    	String Comments = request.getParameter( "Comments" );
    	String Status = request.getParameter( "Status" );
    	int UserID = (int) session.getAttribute("userID") ;
    	boolean DoCheck = false;
    	
    	//Insert logic here
    	DispatcherAction dispatcherAction = new DispatcherAction();
    	DoCheck = dispatcherAction.DispatcherOrder(OrderID, UserID, DriverID, Comments, Status);
    	
    	String forward = "";
    	if (DoCheck) {
    		forward = "/DeliverySuccess";
    	} else {
    		forward = "/DeliveryFail";
    	}
    	
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
    	
	}


}
