



import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class mail{
 
	public static void sendmail(String to2,String sub2,String msg2)  {
		//Security.setProperty("ssl.SocketFactory.provider", "com.ibm.jsse2.SSLSocketFactoryImpl");
 
		final String username = "services.imasads@gmail.com";
		final String password = "iMAS12345";
		final String to1=to2;
		final String sub1=sub2;
		final String msg1=msg2;
		
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
				}
				});

 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("www.gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to1));
			message.setSubject(sub1);
			message.setText(msg1);
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
