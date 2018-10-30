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
}
