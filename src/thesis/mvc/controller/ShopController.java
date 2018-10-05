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
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.PharmacyImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Branch;
import thesis.mvc.model.Customer;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;
import thesis.mvc.model.Pharmacy;
import thesis.mvc.model.Product;
import thesis.mvc.pageaction.ApprovalAction;
import thesis.mvc.pageaction.PurchaseAction;
import thesis.mvc.pageaction.PurchaseAction.CartList;
import thesis.mvc.pageaction.SearchAction;
import thesis.mvc.utility.DBUtility;
import thesis.mvc.utility.SendEmail;

@WebServlet("/ShopController")
public class ShopController extends HttpServlet {
	
	private Connection conn;

	public ShopController() {
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
		if (session.getAttribute("PharmaID") != null) {
			PharmaID = (int) session.getAttribute("PharmaID");
			session.setAttribute("SelectedPharmacy", new PharmacyImplement().getPharmacyById(PharmaID));
		} else {
			//Go home
		}
		
		
		/*} else if (request.getParameter("PharmaID") != null && !request.getParameter("PharmaID").isEmpty()){
			PharmaID = Integer.parseInt( request.getParameter( "PharmaID" ) );
			BranchImplement branchImplement = new BranchImplement();
			session.setAttribute("SelectedBranch", branchImplement.getBranchById(PharmaID));
		}*/
		
		
		boolean test = true;
		
		if (isInteger(action) && Integer.parseInt(action) > 0) {
			//Get the order
			OrderImplement orderImplement = new OrderImplement();
			Order order = orderImplement.getOrderById(Integer.parseInt(action));
		   	if (order.getOrderStatus().equalsIgnoreCase("APPROVED")) {
		   		session.setAttribute("ApproveChecker", true);
		   	} else {
		   		session.setAttribute("ApproveChecker", false);
		   	}
		   	//Get the Details
		   	OrderDetailImplement orderDetailImplement = new OrderDetailImplement();
		   	List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
			OrderDetails = orderDetailImplement.getspecificOrderDetail(Integer.parseInt(action));
			
			//Ready the Cart List
			PurchaseAction purchaseAction = new PurchaseAction();
			List<CartList> cartlists = new ArrayList<CartList>();
			ProductImplement productImplement = new ProductImplement();
			for (OrderDetail orderDetail : OrderDetails) {
				CartList cartlist = purchaseAction.new CartList();
				//Product Info
				Product product = productImplement.getProductById(orderDetail.getProductID());
				cartlist.setName(product.getProductName());
				cartlist.setDescription(product.getProductDescription());
				cartlist.setImage(product.getProductImage());
				cartlist.setSize(product.getProductPackaging());
				cartlist.setPrescription(product.isRXProduct());
				
				//Other Details
				cartlist.setQuantity(orderDetail.getQuantity());
				cartlist.setUnitCost(orderDetail.getCostPerUnit());
				cartlist.setTotalCost(orderDetail.getTotalCost());
				cartlists.add(cartlist);
			}
			
			//Set The UserID
			session.setAttribute("orderReciept", order);
			session.setAttribute("CartlistReciept", cartlists);
			//if (true) {
			//	forward = "/Checkout.jsp";
			//} else {
			//	forward = "/shop";
			//}
			forward = "/Catalog.jsp";
		   	RequestDispatcher view = request.getRequestDispatcher( forward );
		   	view.forward(request, response);
		} else {
		   	SearchAction searchAction = new SearchAction();
		   	forward = "/Catalog.jsp";
		   	request.setAttribute( "productList", searchAction.GeneralListing(PharmaID) );
		   	RequestDispatcher view = request.getRequestDispatcher( forward );
		   	view.forward(request, response);
			
			
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
	}
    
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		List<OrderDetail> OrderDetails = new ArrayList<OrderDetail>();
		if (session.getAttribute("OrderDetails") != null) {
			OrderDetails = (List<OrderDetail>) session.getAttribute("OrderDetails");
		}
		
		String action = null;
		if (request.getParameter( "Action" ) != null) {
			action = request.getParameter( "Action" );	
		}
		
		if (action.equalsIgnoreCase("AddtoCart")) {
			//sets order and generates it if it does not exist
			Order order = (Order) session.getAttribute("Order");

			//Set the branch 
			Pharmacy selectedPharmacy = new Pharmacy();
			selectedPharmacy = (Pharmacy) session.getAttribute("SelectedPharmacy");
			int PID = selectedPharmacy.getPharmacyID();
			
			if (order == null) {
				int UID = (int) session.getAttribute("userID");
				CustomerImplement customerImplement = new CustomerImplement();
				Customer customer = new Customer();
				customer = customerImplement.getCustomerByUserId(UID);
				int CusID = customer.getCustomerID();
				String ADD = customer.getAddress();
				boolean SID = customer.isIsSeniorCitizen();
				int CID = customer.getCityID();

				order = new PurchaseAction().setInitalOrder(CusID, ADD, SID, CID, PID);
				session.setAttribute("Order", order );
			}
			//ProductID & Quantity & Cost per unit
			int ProductID = Integer.valueOf( request.getParameter( "ProductID" ) );
			int Quantity = Integer.valueOf( request.getParameter( "Quantity" ) );
			double CostPerUnit = new PurchaseAction().getProductCost( ProductID, PID, order);
			
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
			if (session.getAttribute("CartList") != null) {
				cartlists = (List<CartList>) session.getAttribute("CartList");
			}
			CartList cartlist = new PurchaseAction().new CartList();
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
			
			response.sendRedirect(request.getContextPath() + "/CatalogBasic.jsp");
		}
	}
	
	public static boolean isInteger(String s) {
	    try { 
	        Integer.parseInt(s); 
	    } catch(NumberFormatException e) { 
	        return false; 
	    } catch(NullPointerException e) {
	        return false;
	    }
	    // only got here if we didn't return false
	    return true;
	}

}
