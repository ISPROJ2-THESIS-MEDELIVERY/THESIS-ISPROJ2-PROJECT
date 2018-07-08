package thesis.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import thesis.mvc.implement.BranchImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.pageaction.*;

@WebServlet("/HomeController")
public class HomeController  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		BranchImplement branchImplement = new BranchImplement();
		OrderImplement orderImplement = new OrderImplement();
		request.setAttribute( "Pharmacy", branchImplement.getAllBranch());
		if (session.getAttribute("userID") != null) {
			request.setAttribute( "PurchasePending", orderImplement.getPendingOrder((int) session.getAttribute("userID")));
		}
		RequestDispatcher view = request.getRequestDispatcher( "/Home.jsp" );
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view;
		view = request.getRequestDispatcher( "/invalidError.jsp" );
		//request.setAttribute("customers", dao.getAllCustomers());
		view.forward(request, response);
	}
}
