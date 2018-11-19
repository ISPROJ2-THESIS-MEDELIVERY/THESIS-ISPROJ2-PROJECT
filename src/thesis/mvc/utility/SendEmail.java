package thesis.mvc.utility;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import thesis.mvc.implement.CityListingImplement;
import thesis.mvc.implement.CustomerImplement;
import thesis.mvc.implement.OrderDetailImplement;
import thesis.mvc.implement.OrderImplement;
import thesis.mvc.implement.ProductImplement;
import thesis.mvc.model.Order;
import thesis.mvc.model.OrderDetail;

public class SendEmail 
{ 
	public boolean send(String to, String sub, String msg)
	{ 
		Properties props = new Properties();
	    
		try {	
		//create an instance of Properties Class   
		
		/* 
		 * Specifies the IP address of your default mail server
		 * for e.g if you are using gmail server as an email sever
		 * you will pass smtp.gmail.com as value of mail.smtp host. 
		 * As shown here in the code. 
		 * Change accordingly, if your email id is not a gmail id
		 */
			props.put("mail.smtp.host", "smtp.gmail.com");//localhost
			//below mentioned mail.smtp.port is optional
			props.put("mail.smtp.port", "587");//25
			props.put("mail.smtp.auth", "true");//false
			props.put("mail.smtp.starttls.enable", "true");//false
		
		}
		catch(Exception e)
		{
			 e.printStackTrace();
			 return false;
		}
		/*
		 * Pass Properties object(props) and Authenticator object for authentication to Session instance 
		 */
		Session session = Session.getInstance(props,new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication("testpokerthing@gmail.com","Hey!0821");
			}
		});

		//Session session = Session.getInstance(props);
		try
		{
		
			/*
			 * Create an instance of MimeMessage, 
			 * it accept MIME types and headers 
			 */
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("Medelivery-Notification"));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			message.setContent(msg, "text/html; charset=utf-8");
			
			/* Transport class is used to deliver the message to the recipients */
			
			Transport.send(message);
		
		}
		catch(Exception e)
		{
			 e.printStackTrace();
			 return false;
		}
	return true;
	}
	
	public String OrderEmail(Order orderRecieve) {
		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm a");
		Order order = new OrderImplement().getOrderById(orderRecieve.getOrderID());
		List<OrderDetail> OrderDetails = new OrderDetailImplement().getspecificOrderDetail(order.getOrderID());
		String HTMLMessage = "";
		
		if (order.getOrderStatus().equalsIgnoreCase("PENDING1")) {
			HTMLMessage +=
					"<h3>Thank you for ordering from us! </br> Your order is currently being processed</h3>\r\n" + 
					"You'll receive an email when your items have been confirmed. If you have any questions feel free to Email us at <a href=\"medeliveryincorporated@gmail.com\r\n" + 
					"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; \r\n" + 
					"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a>"; 
		} else if (order.getOrderStatus().equalsIgnoreCase("EN-ROUTE")) {
			HTMLMessage +=
					"<h3>Thank you for ordering from us! </br> Your order will arrive within 24 hours! </h3>" + 
					"If you have any questions Email us at <a href=\"medeliveryincorporated@gmail.com" + 
					"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; " + 
					"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a><hr>";
		} else if (order.getOrderStatus().equalsIgnoreCase("CANCELLED")) {
			HTMLMessage +=
					"<h3>You have successfully cancelled your order! </h3> </br>" + 
					"If you have any questions Email us at <a href=\"medeliveryincorporated@gmail.com" + 
					"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; " + 
					"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a>";
		} else if (order.getOrderStatus().equalsIgnoreCase("INVALID")) {
			HTMLMessage +=
					"<h3>We're Sorry, unfortunately your order has been cancelled due to your prescription being invalidated</h3>" + 
					"Disclaimer: Medelivery reserves the right to cancel any such orders with unverifiable identification / falsified prescriptions." + 
					"For further detail concerning your orders cancellation please kindly Email us at <a href=\"medeliveryincorporated@gmail.com" + 
					"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; " + 
					"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a>"; 
		} else if (order.getOrderStatus().equalsIgnoreCase("PENDING5")) {
			HTMLMessage +=
					"<h3>We're Sorry, unfortunately your order has been cancelled due to no pharmacy wanting to pick up your order</h3>" + 
					"Disclaimer: Medelivery reserves the right to cancel any such orders with unverifiable identification / falsified prescriptions." + 
					"For further detail concerning your orders cancellation please kindly Email us at <a href=\"medeliveryincorporated@gmail.com" + 
					"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; " + 
					"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a>"; 
		}
		HTMLMessage +=
				"<h4>Order #: " + order.getOrderID() + "</h4></br>" + 
				"<h4>Order Date: " + dateFormat.format(order.getDateOrdered()) + "</h4></br>" + 
				"<h4>Order Status: "  + order.getOrderStatus() + "</h4></br>" + 
				"<h4>Customer Name: " + new CustomerImplement().getCustomerById(order.getCustomerID()).getCustomerName() + "</h4></br>" + 
				"<h4>Address: " + order.getOrderAddress() + "</h4></br>" + 
				"<h4>City: " + new CityListingImplement().getCityListingById(order.getCityID()).getCityName() + "</h4>" +  
				"<h4>ITEMS ORDERED</h4>" + 
				"<table cellspacing=\"0\" cellpadding=\"2\" align=\"Left\">                                                                                                                                               " + 
				"<table>" +
				"<thead>" + 
				"	<tr>" + 
				"  		<th>Item</th>" + 
				"  		<th>Quantity</th>" + 
				"  		<th>Unit Price</th>" + 
				"	</tr>" + 
				"</thead>" + 
				"<tbody>";
		for (OrderDetail orderDetail : OrderDetails) {
			HTMLMessage +=
					"        <tr>" + 
					"            <td>"+ new ProductImplement().getProductById(orderDetail.getProductID()).getProductName() +"</td>" + 
					"            <td style=\"text-align: center;\" width=\"60\">" + orderDetail.getQuantity() + "</td>" + 
					"            <td style=\"text-align: center;\" width=\"100\">"+ orderDetail.getCostPerUnit() + "</td>" + 
					"        </tr>";
		}

		HTMLMessage +=
				"    </tbody>" + 
				"</table></br>" + 
				"<h4>Delivery Fee: 50 Pesos</h4></br>" + 
				"<h4>Discount: N/A</h4></br>" + 
				"<h4>Order Total (Vat inclusive):" + order.getActualCost() +"</h4></br>" + 
				"<img src=\"https://isproj2a.benilde.edu.ph/Medelivery/assets/img/medlogopill.png\" alt=\"\" width=\"125\">";
		return HTMLMessage;
	}
}
