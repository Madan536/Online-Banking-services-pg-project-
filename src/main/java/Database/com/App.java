package Database.com;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class App {
	public static void send(String rec,String Account) {
		Properties pro=new Properties();
		pro.put("mail.smtp.auth","true");
		pro.put("mail.smtp.starttls.enable","true");
		pro.put("mail.smtp.host","smtp.gmail.com");
		pro.put("mail.smtp.port","587");
		System.out.println(pro);
//		pro.put("mail.smtp.socketFactory.post", "587");
//		pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLsocketFoctory");
		     
	String username="Onlinebankung@gmail.com";
	String password="zwzruoevkxebdffb";
//	String password="mafiystccnlazouz";
		     
	
	Session session=Session.getInstance(pro,new Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username,password);
	}
	});
	
	Message message=prepareMessage(session,username,rec,Account);
	try {
		Transport.send(message);
	}catch(Exception e) {
		System.out.println(e.getMessage());
		System.out.println("e");
	}
	System.out.println("success");
	
	}
	
	
	private static Message prepareMessage(Session session,String username,String rec,String account) {
		Message message=new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(username));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(rec));
			message.setSubject(" Madan Online Banking Services");
			message.setText("Welcome to Online Banking Services  "+"Account No : "+account);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return message;
		
	}
	
}
