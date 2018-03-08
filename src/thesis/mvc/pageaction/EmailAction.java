package thesis.mvc.pageaction;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 

public class EmailAction {

	public void sendEmail(String toAddr, String subject, String body)
	{

		final String username = "edennyyu@gmail.com";
		final String password = "Hey!0821";
		
		//Get properties object    
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class",    
                  "javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");    

		 Session session = Session.getDefaultInstance(props,    
		           new javax.mail.Authenticator() {    
		           protected PasswordAuthentication getPasswordAuthentication() {    
		           return new PasswordAuthentication(username,password);  
		           }    
		          });    
		
		 try {    
	           MimeMessage message = new MimeMessage(session);    
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(toAddr));    
	           message.setSubject(subject);    
	           message.setText(body);    
	           //send message  
	           Transport.send(message);    
	           System.out.println("message sent successfully");    
	          } catch (MessagingException e) {throw new RuntimeException(e);}    
		
		
	}
}
