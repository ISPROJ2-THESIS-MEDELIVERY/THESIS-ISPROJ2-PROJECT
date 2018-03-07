package thesis.mvc.pageaction;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailAction {

	final private static String host = "smtp.gmail.com";
	final private static String user = "edennyyu";
	final private static String pass = "Hey!0821";

	public void sendEmail(String toAddr, String subject, String body)
	{

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", "587");
	      
	    Session session = Session.getDefaultInstance(props,
	  		  new javax.mail.Authenticator() {
	  			protected PasswordAuthentication getPasswordAuthentication() {
	  				return new PasswordAuthentication(user, pass);
	  			}
	  		  });
	    

	    try
	    {
		    Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("edennyyu@gmail.com"));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddr));
	        message.setSubject(subject);
	        message.setText(body);
	        Transport.send(message);
	    }
	    catch (AddressException e) {e.printStackTrace();}
	    catch (MessagingException e) {e.printStackTrace();}
	}
}
