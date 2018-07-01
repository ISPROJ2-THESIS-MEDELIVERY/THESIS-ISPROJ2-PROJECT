package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.DriverImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.pageaction.DispatcherAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/DispatcherController")
public class DispatcherController {
	
	private Connection conn;

	public DispatcherController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int AccessLevel = Integer.parseInt( request.getParameter( "ProductID" ) );
		HttpSession session = request.getSession();
    	String forward = "";
    	if (AccessLevel == 2) {
    		forward = "/DeliveryHome.jsp";
    		//Insert needed things here
    		DriverImplement driverImplement = new DriverImplement();
    		OrderImplement orderImplement = new OrderImplement();
    		session.setAttribute("DriverList", driverImplement.getAllDrivers() );
    		session.setAttribute("OrderList", orderImplement.getOrder() );
    	} else {
    		forward = "/Home.jsp";
    	}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int OrderID = Integer.parseInt( request.getParameter( "OrderID" ) );
    	boolean DoCheck = false;
    	
    	//Insert logic here
    	DispatcherAction dispatcherAction = new DispatcherAction();
    	
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
