package thesis.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thesis.mvc.utility.DBUtility;

public class InformationController {
	
	private Connection conn;

	public InformationController() {
		conn = DBUtility.getConnection();
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Action = request.getParameter( "Action" );
		if (Action.isEmpty()) {
			
		}
		
	}
}
