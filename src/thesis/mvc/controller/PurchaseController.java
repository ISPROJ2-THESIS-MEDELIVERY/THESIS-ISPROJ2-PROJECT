package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Branch;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.EmailAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.pageaction.PurchaseAction.CartList;
import thesis.mvc.pageaction.SearchAction.ProductList;
import thesis.mvc.pageaction.RegistrationAction;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.SendEmail;

@WebServlet("/PurchaseController")
public class PurchaseController extends HttpServlet {
	
	private Connection conn;

	public PurchaseController() {
		conn = DBUtility.getConnection();
	}
	
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Ensures that the person can select what he/she wants to buy
		String forward;
		HttpSession session = request.getSession();
		
		String action = "";
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			action = request.getParameter( "action" );			
		}
		
		int PharmaID = 0;
		if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()) {
			PharmaID = Integer.parseInt( request.getParameter( "PharmaID" ) );
			BranchImplement branchImplement = new BranchImplement();
			session.setAttribute("SelectedBranch", branchImplement.getBranchById(PharmaID));
		}
		
		int access = 0;
		if (session.getAttribute("userAccess") != null) {
			access = (int) session.getAttribute("userAccess");	
		}
		
		
		boolean test = true;
    	
		if (access == 1) {
    		SearchAction searchAction = new SearchAction();
    		//forward = "/A-test-shop.jsp";
    		forward = "/Catalog.jsp";
    		request.setAttribute( "productList", searchAction.GeneralListing(PharmaID) );
    		RequestDispatcher view = request.getRequestDispatcher( forward );
    		view.forward(request, response);
    	} else if (access == 3) {
    		if (action.equalsIgnoreCase("Approve")) {
	    		forward = "PharmacistPage.jsp";
        		PurchaseAction purchaseAction = new PurchaseAction();
        		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ), true );
        		RequestDispatcher view = request.getRequestDispatcher( forward );
        		view.forward(request, response);
        	} else if (action.equalsIgnoreCase("Reject")) {
	    		forward = "PharmacistPage.jsp";
        		PurchaseAction purchaseAction = new PurchaseAction();
        		purchaseAction.pharmacistApproval( Integer.parseInt( request.getParameter( "orderID" ) ) , false );
        		RequestDispatcher view = request.getRequestDispatcher( forward );
        		view.forward(request, response);
        		
        	} else if (PharmaID != 0) {
	    		ApprovalAction approvalAction = new ApprovalAction();
	    		session.setAttribute("orderPharmacistCheck", approvalAction.getRegularOrder(PharmaID) );
	    		forward = "PharmacistPage.jsp";
	    		RequestDispatcher view = request.getRequestDispatcher( forward );
	    		view.forward(request, response);
        	} else {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
    	} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
    	}
		
		
		/*
		 String forward;
		int BranchID = Integer.parseInt( request.getParameter( "BranchID" ) );
		HttpSession session = request.getSession();
		forward = "/Catalog.jsp";
		
		SearchAction searchAction = new SearchAction();
		ProductList productList	= searchAction.GeneralListing(BranchID);
		
		RequestDispatcher view = request.getRequestDispatcher( forward );
		view.forward(request, response);
		 */
	}
    
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward;
		int ProductID = 2;
		int Quantity = 2;
		double CostPerUnit = 0.0;
    	conn = DBUtility.getConnection();
		String action = "";
		if (request.getParameter( "Action" ) != null) {
			action = request.getParameter( "Action" );	
		}
		HttpSession session = request.getSession(true);
		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
		PurchaseAction purchaseAction = new PurchaseAction();
		Boolean SurgeCheck;
		
		//Safety measure
		if (session.getAttribute("userID") != null && session.getAttribute("SelectedBranch") != null) {
			SurgeCheck = true;		
		} else {
			SurgeCheck = false;
		}
		
		if(action.equalsIgnoreCase("Addtocart") && SurgeCheck) {
			
			//sets order and generates it if it does not exist
			Order order = (Order) session.getAttribute("Order");
			
			if(order == null) { // || order.getBranchID() != Current Branch
				int UID = (int) session.getAttribute("userID");
				CustomerImplement customerImplement = new CustomerImplement();
				Customer customer = new Customer();
				customer = customerImplement.getCustomerById(UID);
				String ADD = customer.getAddress();
				boolean SID = customer.isIsSeniorCitizen();
				int CID = customer.getCityID();
				Branch SelectedBranch = new Branch();
				SelectedBranch = (Branch) session.getAttribute("SelectedBranch");
				int BID = SelectedBranch.getBranchID();
				session.setAttribute("OrderDetails", OrderDetails );
				
				order = purchaseAction.setInitalOrder(UID, ADD, SID, CID, BID);
				session.setAttribute("Order", order );
				
				//ProductID & Quantity & Cost per unit
				ProductID = Integer.valueOf( request.getParameter( "ProductID" ) );
				Quantity = Integer.valueOf( request.getParameter( "Quantity" ) );
				CostPerUnit = purchaseAction.getProductCost( ProductID, BID, order);
				
				//Takes the existing order detail if there is and adds the next order detail to there
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProductID(ProductID);
				orderDetail.setQuantity(Quantity);
				orderDetail.setCostPerUnit(CostPerUnit);
				orderDetail.setTotalCost( Math.round(CostPerUnit * Quantity * 100) / 100 );
				OrderDetails.add( orderDetail );
				session.setAttribute("OrderDetails", OrderDetails );

				
				//Insert things into cartDetails
				ProductImplement productImplement = new ProductImplement();
				Product product = new Product();
				product = productImplement.getProductById(orderDetail.getProductID());
				
				List<CartList> cartlists = new ArrayList<CartList>();
				CartList cartlist = purchaseAction.new CartList();
				cartlist.setName(product.getProductName());
				cartlist.setDescription(product.getProductDescription());
				cartlist.setImage(product.getProductImage());
				cartlist.setSize(product.getProductPackaging());
				cartlist.setPrescription(product.isRXProduct());
				cartlist.setQuantity(orderDetail.getQuantity());
				cartlist.setUnitCost(orderDetail.getCostPerUnit());
				cartlist.setTotalCost(orderDetail.getTotalCost());
				cartlists.add(cartlist);
				session.setAttribute("CartList", cartlists );
				
				//Refreshes and goes back to the cart
				forward = "/Cart.jsp";
				//forward = "/A-test-customerpurchasecheckout.jsp";
			} else {
				//ProductID & Quantity & Cost per unit
				ProductID = Integer.valueOf( request.getParameter( "ProductID" ) );
				Quantity = Integer.valueOf( request.getParameter( "Quantity" ) );
				CostPerUnit = purchaseAction.getProductCost( ProductID, 1, order );
				
				//Takes the existing order detail if there is and adds the next order detail to there
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProductID(ProductID);
				orderDetail.setQuantity(Quantity);
				orderDetail.setCostPerUnit(CostPerUnit);
				orderDetail.setTotalCost(CostPerUnit * Quantity);
				OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
				OrderDetails.add( orderDetail );
				session.setAttribute("OrderDetails", OrderDetails );
				
				//Insert things into cartDetails
				ProductImplement productImplement = new ProductImplement();
				Product product = new Product();
				product = productImplement.getProductById(orderDetail.getProductID());
				
				List<CartList> cartlists = (List<CartList>) session.getAttribute("CartList");
				CartList cartlist = purchaseAction.new CartList();
				cartlist.setName(product.getProductName());
				cartlist.setDescription(product.getProductDescription());
				cartlist.setImage(product.getProductImage());
				cartlist.setSize(product.getProductPackaging());
				cartlist.setPrescription(product.isRXProduct());
				cartlist.setQuantity(orderDetail.getQuantity());
				cartlist.setUnitCost(orderDetail.getCostPerUnit());
				cartlist.setTotalCost(orderDetail.getTotalCost());
				cartlists.add(cartlist);
				session.setAttribute("CartList", cartlists );
				
				//Refreshes and goes back to the cart
				forward = "/Cart.jsp";
				//forward = "/A-test-customerpurchasecheckout.jsp";
			}
			
		} else if (action.equalsIgnoreCase("Checkout") && SurgeCheck) {
			
			Order order = (Order) session.getAttribute("Order");
			OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
			List<CartList> cartList = (List<CartList>) session.getAttribute("CartList");
			SendEmail sendEmail = new SendEmail();
			CustomerImplement customerImplement = new CustomerImplement();
			int userID = (int) session.getAttribute("userID");
			
			
			String CustomerEmail = customerImplement.getCustomerById(userID).getEmail();

			Date CurrentDate = new Date(Calendar.getInstance().getTime().getTime());
			boolean checker = purchaseAction.purchaseOrder(order, OrderDetails) && sendEmail.send(CustomerEmail, "Reciept of transaction on " + CurrentDate, "This is a test message");
			purchaseAction.purchaseOrder(order, OrderDetails);
			if(order == null || OrderDetails.isEmpty()) {
				forward = "/index.jsp"; //or an error page
			} else {
				session.setAttribute("orderReciept", order);
				session.setAttribute("CartlistReciept", cartList);
				session.removeAttribute("Order");
				session.removeAttribute("OrderDetails");
				session.removeAttribute("CartList");
				forward = "Checkout.jsp";

				
			}
			//order.setOrderAddress( request.getParameter( "orderAddress" ) );
			//order.setPaymentMethod( request.getParameter( "orderPayment" ) );
			//order.setDateOrdered(today);
			
		} else {
			forward = "/index.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher( forward );
		if (SurgeCheck) {
			view.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}

}
