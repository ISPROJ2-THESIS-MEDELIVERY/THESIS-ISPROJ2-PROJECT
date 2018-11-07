package thesis.mvc.utility;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

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
	
	public String OrderEmail() {
		String HTMLMessage = "\r\n" + 
				"<h3>Thank you for ordering from us! </br> Your order will arrive within 24 hours! </h3>\r\n" + 
				"\r\n" + 
				"If you have any questions Email us at <a href=\"medeliveryincorporated@gmail.com\r\n" + 
				"\" class=\"es-button\" target=\"_blank\" style=\"font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; \r\n" + 
				"border-radius: 5px;  none repeat scroll 0% 0%; \">medeliveryincorporated@gmail.com</a>\r\n" + 
				"\r\n" + 
				"<hr>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Order #:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Order Date:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Order Status</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Customer Name:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Address:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">City:</span>\r\n" + 
				"\r\n" + 
				"<h4>ITEMS ORDERED</h4>\r\n" + 
				"<table cellspacing=\"0\" cellpadding=\"0\" align=\"right\">                                                                                                                                               \r\n" + 
				"<table>\r\n" + 
				"    <tbody>\r\n" + 
				"        <tr>\r\n" + 
				"            <td>item name</td>\r\n" + 
				"            <td style=\"text-align: center;\" width=\"60\">1</td>\r\n" + 
				"            <td style=\"text-align: center;\" width=\"100\">$20.00</td>\r\n" + 
				"        </tr>\r\n" + 
				"    </tbody>\r\n" + 
				"</table>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Delivery Fee:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Discount:</span>\r\n" + 
				"</br>\r\n" + 
				"<span style=\"font-size: 14px; line-height: 150%;\">Order Total (Vat inclusive):</span>\r\n" + 
				"</br>\r\n" + 
				"\r\n" + 
				"<img src=\"https://isproj2a.benilde.edu.ph/Medelivery/assets/img/medlogopill.png\" alt=\"\" width=\"125\">";
		return HTMLMessage;
	}
}
