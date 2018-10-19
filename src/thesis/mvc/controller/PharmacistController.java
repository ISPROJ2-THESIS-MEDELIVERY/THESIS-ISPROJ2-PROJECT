package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacistImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.utility.DBUtility;

@WebServlet("/PharmacistController")
public class PharmacistController extends HttpServlet{
	
	private Connection conn;
	private static final String UPLOAD_DIR = "images";
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	public PharmacistController() {
		conn = DBUtility.getConnection();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter( "Action" );
		
	    if (action.equalsIgnoreCase("GoToOrders")) {
			//Get Pharma ID
	    	int PharmaID = Integer.parseInt(request.getParameter( "PharmaID" ));
	    	//get Pharma Orders
			List<Order> PharmacyOrders = new ArrayList<Order>();
			PharmacyOrders = new OrderImplement().getOrderByPharmacyId(PharmaID);
			session.setAttribute("PharmacyOrders", PharmacyOrders);
			//Get Pharma order Details
			List<OrderDetail> test = new OrderDetailImplement().getOrderDetail();
			request.setAttribute("PharmacyOrdersDetails", test );
			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
		} else if (action.equalsIgnoreCase("RejectOrder")){

			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
		} else if (action.equalsIgnoreCase("ApproveOrder")){
			/*
			//Finish this
			int BranchofPharmacist = new PharmacistImplement().getPharmacistById( (int) session.getAttribute("Pharmacist") ).getBranchID();
			int PharmacyofBranch = new BranchImplement().getBranchById(BranchofPharmacist).getPharmacyID();
			request.setAttribute("PharmacistPharmacy", new PharmacyImplement().getPharmacyById(PharmacyofBranch));
			request.setAttribute("PharmacyOrderDetailsList", new OrderDetailImplement().getOrderDetail());
			response.sendRedirect(request.getContextPath() + "/PharmacistBasic.jsp");
			*/
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
