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
		String HTMLMessage = "<body>\r\n" + 
				"    <div class='es-wrapper-color'>\r\n" + 
				"        <!--[if gte mso 9]>\r\n" + 
				"			<v:background xmlns:v='urn:schemas-microsoft-com:vml' fill='t'>\r\n" + 
				"				<v:fill type='tile' color='#efefef'></v:fill>\r\n" + 
				"			</v:background>\r\n" + 
				"		<![endif]-->\r\n" + 
				"        <table class='es-wrapper' width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"            <tbody>\r\n" + 
				"                <tr>\r\n" + 
				"                    <td class='esd-email-paddings' valign='top'>\r\n" + 
				"                        <table class='es-content es-preheader esd-header-popover' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='es-adaptive esd-stripe' esd-custom-block-id='1733' align='center'>\r\n" + 
				"                                        <table class='es-content-body' style='background-color: rgb(239, 239, 239);' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p5t es-p5b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                       \r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <table class='es-header' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' esd-custom-block-id='1735' align='center'>\r\n" + 
				"                                        <table class='es-header-body' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p5t es-p5b es-p15r es-p15l' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='570' cellpadding='0' cellspacing='0'><tr><td width='180' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p0r esd-container-frame' width='180' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    \r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='20'></td><td width='370' valign='top'><![endif]-->\r\n" + 
				"                                                        <table cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='370' align='left'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-menu' esd-img-prev-h='16' esd-img-prev-w='13'>\r\n" + 
				"                                                                                        <table class='es-menu' width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr class='links'>\r\n" + 
				"                                                                                                    <td class='es-p10t es-p10b es-p5r es-p5l' style='padding-bottom: 10px; padding-top: 20px; ' id='esd-menu-id-0' width='25.00%' bgcolor='transparent' align='center'> <a style='color: #333333;font-size: 16px;margin-right: 600px;' href='insert medelivery home link here'>Home</a> </td>\r\n" + 
				"                                                                                                    </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <table class='es-content' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' esd-custom-block-id='1754' align='center'>\r\n" + 
				"                                        <table class='es-content-body' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n" + 
				"                                            \r\n" + 
				"                                            \r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p10t es-p10b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table style='border-radius: 0px; border-collapse: separate;' width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p10t es-p15b' align='center'>\r\n" + 
				"                                                                                        <h1>Thank you for ordering from us! Has been processed and should arrive within the Next 24 hours<br></h1>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p5t es-p5b es-p40r es-p40l' align='center'>\r\n" + 
				"                                                                                        <p style='color: rgb(51, 51, 51);'>Should there be any issues concenring you order kindly Call us at #######.<br></p>\r\n" + 
				"\r\n" + 
				"<br>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-button es-p15t es-p10b' align='center'> <span class='es-button-border' style='border-radius: 5px;    '> <a href='insert order status page here' class='es-button' target='_blank' style='font-size: 16px; border-top-width: 10px; border-bottom-width: 10px; border-radius: 5px;  none repeat scroll 0% 0%; '>View order status</a> </span> </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <br>\r\n" + 
				"\r\n" + 
				"<table class='es-content' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' esd-custom-block-id='1755' align='center'>\r\n" + 
				"                                        <table class='es-content-body' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20t es-p30b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='560' cellpadding='0' cellspacing='0'><tr><td width='280' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p20b esd-container-frame' width='280' align='left'>\r\n" + 
				"                                                                        <table style='background-color: #21a9af;border-color: rgb(239, 239, 239);border-collapse: separate;border-width: 1px 0px 1px 1px;border-style: solid;' width='100%' cellspacing='0' cellpadding='0' bgcolor='#fef9ef'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p20t es-p10b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                                                        <h4>SUMMARY:</h4>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p20b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                                                        <table style='width: 100%;' class='cke_show_border' cellspacing='1' cellpadding='1' border='0' align='left'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td><span style='font-size: 14px; line-height: 150%;'>Order #:</span></td>\r\n" + 
				"                                                                                                    <td><span style='font-size: 14px; line-height: 150%;'>####</span></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                        <p style='line-height: 150%;'><br></p>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='0'></td><td width='280' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-right' cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='280' align='left'>\r\n" + 
				"                                                                        <table style='background-color: #21a9af;border-collapse: separate;border-width: 1px;border-style: solid;border-color: rgb(239, 239, 239);' width='100%' cellspacing='0' cellpadding='0' bgcolor='#fef9ef'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p20t es-p10b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                                                        <h4>SHIPPING ADDRESS:<br></h4>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p20b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                                                        <p>Customer name</p>\r\n" + 
				"                                                                                        <p>Address</p>\r\n" + 
				"                                                                                        <p>City</p>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <table class='es-content' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' esd-custom-block-id='1758' align='center'>\r\n" + 
				"                                        <table class='es-content-body' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p10t es-p10b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='560' cellpadding='0' cellspacing='0'><tr><td width='270' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p0r es-m-p20b esd-container-frame' width='270' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text es-p20l' align='left'>\r\n" + 
				"                                                                                        <h4>ITEMS ORDERED</h4>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='20'></td><td width='270' valign='top'><![endif]-->\r\n" + 
				"                                                        <br>\r\n" + 
				"<table cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='270' align='left'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text' align='left'>\r\n" + 
				"                                                                                        <table style='width: 100%;' class='cke_show_border' cellspacing='1' cellpadding='1' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td><span style='font-size:13px;'>NAME</span></td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='60'><span style='font-size:13px;'><span style='line-height: 100%;'>QTY</span></span>\r\n" + 
				"                                                                                                    </td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='100'><span style='font-size:13px;'><span style='line-height: 100%;'>PRICE</span></span>\r\n" + 
				"                                                                                                    </td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-spacer es-p10b' align='center'>\r\n" + 
				"                                                                                        <table width='100%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='border-bottom: 1px solid rgb(239, 239, 239); background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;'></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p5t es-p10b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='560' cellpadding='0' cellspacing='0'><tr><td width='178' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p0r es-m-p20b esd-container-frame' width='178' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-image' align='center'>\r\n" + 
				"                                                                                        <a href='' target='_blank'><img src='insert image link here' alt='########' class='adapt-img' title='Natural Balance L.I.D., sale 30%' width='125'></a>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='20'></td><td width='362' valign='top'><![endif]-->\r\n" + 
				"                                                        <table cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='362' align='left'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text' align='left'>\r\n" + 
				"                                                                                        <p><br></p>\r\n" + 
				"                                                                                        <table style='width: 100%;' class='cke_show_border' cellspacing='1' cellpadding='1' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td>item name</td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='60'>1</td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='100'>$20.00</td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                        <p><br></p>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-spacer es-p10b' align='center'>\r\n" + 
				"                                                                                        <table width='100%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='border-bottom: 1px solid rgb(239, 239, 239); background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;'></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p5t es-p10b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='560' cellpadding='0' cellspacing='0'><tr><td width='178' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p0r es-m-p20b esd-container-frame' width='178' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-image' align='center'>\r\n" + 
				"                                                                                        <a href='' target='_blank'><img src='insert image link here' alt='#####' class='adapt-img' title='Dog Treats' width='125'></a>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='20'></td><td width='362' valign='top'><![endif]-->\r\n" + 
				"                                                        <table cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='362' align='left'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text' align='left'>\r\n" + 
				"                                                                                        <p><br></p>\r\n" + 
				"                                                                                        <table style='width: 100%;' class='cke_show_border' cellspacing='1' cellpadding='1' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td>item name<br></td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='60'>1</td>\r\n" + 
				"                                                                                                    <td style='text-align: center;' width='100'>$2.57</td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                        <p><br></p>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-spacer es-p10b' align='center'>\r\n" + 
				"                                                                                        <table width='100%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='border-bottom: 1px solid rgb(239, 239, 239); background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;'></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    \r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-spacer es-p10b' align='center'>\r\n" + 
				"                                                                                        <table width='100%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='border-bottom: 1px solid rgb(239, 239, 239); background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;'></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p5t es-p30b es-p40r es-p20l' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='540' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-text' align='right'>\r\n" + 
				"                                                                                        <table style='width: 500px;' class='cke_show_border' cellspacing='1' cellpadding='1' border='0' align='right'>\r\n" + 
				"                                                                                            <tbody>\r\n" + 
				"                                                                                                \r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='text-align: right; font-size: 18px; line-height: 150%;'>Delivery fee</td>\r\n" + 
				"                                                                                                    <td style='text-align: right;font-size: 18px;line-height: 150%;color: #172a74;'><strong>\r\n" + 
				"																									 </strong><strong>insert fee here</strong></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='text-align: right; font-size: 18px; line-height: 150%;'>Discount:</td>\r\n" + 
				"                                                                                                    <td style='text-align: right; font-size: 18px; line-height: 150%;'>0.00</td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                                <tr>\r\n" + 
				"                                                                                                    <td style='text-align: right; font-size: 18px; line-height: 150%;'><strong>Order Total:</strong></td>\r\n" + 
				"                                                                                                    <td style='text-align: right;font-size: 18px;line-height: 150%;color: #21a9af;'><strong>insert fee here</strong></td>\r\n" + 
				"                                                                                                </tr>\r\n" + 
				"                                                                                            </tbody>\r\n" + 
				"                                                                                        </table>\r\n" + 
				"                                                                                        <p style='line-height: 150%;'><br></p>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <table class='es-content' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr> </tr>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' esd-custom-block-id='1748' align='center'>\r\n" + 
				"                                        <table class='es-footer-body' width='600' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p20' esd-general-paddings-checked='false' align='left'>\r\n" + 
				"                                                        <!--[if mso]><table width='560' cellpadding='0' cellspacing='0'><tr><td width='178' valign='top'><![endif]-->\r\n" + 
				"                                                        <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='es-m-p0r es-m-p20b esd-container-frame' width='178' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-image es-m-p0l es-m-txt-c' align='left'>\r\n" + 
				"                                                                                        <a href='' target='_blank'></a>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                                \r\n" + 
				"                                                                                \r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td><td width='20'></td><td width='362' valign='top'><![endif]-->\r\n" + 
				"                                                        <table cellspacing='0' cellpadding='0' align='right'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='362' align='left'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            \r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                        <!--[if mso]></td></tr></table><![endif]-->\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                        <table class='esd-footer-popover es-content' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                            <tbody>\r\n" + 
				"                                <tr>\r\n" + 
				"                                    <td class='esd-stripe' align='center'>\r\n" + 
				"                                        <table class='es-content-body' style='background-color: transparent;' width='600' cellspacing='0' cellpadding='0' align='center'>\r\n" + 
				"                                            <tbody>\r\n" + 
				"                                                <tr>\r\n" + 
				"                                                    <td class='esd-structure es-p30t es-p30b es-p20r es-p20l' align='left'>\r\n" + 
				"                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                            <tbody>\r\n" + 
				"                                                                <tr>\r\n" + 
				"                                                                    <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n" + 
				"                                                                        <table width='100%' cellspacing='0' cellpadding='0'>\r\n" + 
				"                                                                            <tbody>\r\n" + 
				"                                                                                <tr>\r\n" + 
				"                                                                                    <td class='esd-block-image es-infoblock' align='center'>\r\n" + 
				"                                                                                        <a target='_blank' href='&lt;!-- insert medelivery home link here --&gt;'> <img src='https://isproj2a.benilde.edu.ph/Medelivery/assets/img/medlogopill.png' alt='' width='125'> </a>\r\n" + 
				"                                                                                    </td>\r\n" + 
				"                                                                                </tr>\r\n" + 
				"                                                                            </tbody>\r\n" + 
				"                                                                        </table>\r\n" + 
				"                                                                    </td>\r\n" + 
				"                                                                </tr>\r\n" + 
				"                                                            </tbody>\r\n" + 
				"                                                        </table>\r\n" + 
				"                                                    </td>\r\n" + 
				"                                                </tr>\r\n" + 
				"                                            </tbody>\r\n" + 
				"                                        </table>\r\n" + 
				"                                    </td>\r\n" + 
				"									\r\n" + 
				"									\r\n" + 
				"									\r\n" + 
				"                                </tr>\r\n" + 
				"                            </tbody>\r\n" + 
				"                        </table>\r\n" + 
				"                    </td>\r\n" + 
				"                </tr>\r\n" + 
				"            </tbody>\r\n" + 
				"        </table>\r\n" + 
				"    </div></body>";
		return HTMLMessage;
	}
}
