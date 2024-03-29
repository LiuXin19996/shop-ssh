package com.mym.shop.uitls;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件发送工具类
 * @author 穆亚梅
 *
 */
public class MailUitls {
	
	public static void sendMail(String to,String code){
		/**
		 * 1.获得一个Session对象.
		 * 2.创建一个代表邮件的对象Message.
		 * 3.发送邮件Transport
		 */
		
		Properties props = new Properties();
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@shop.com", "111");
			}
			
		});
		
		Message message = new MimeMessage(session);
	
		try {
			message.setFrom(new InternetAddress("service@shop.com"));
		
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			
			message.setSubject("来自体育用品销售商城官方激活邮件");
			
			message.setContent("<h1>购物体育用品销售商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://192.168.1.104:8080/shop/user_active.action?code="+code+"'>http://192.168.1.104:8080/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		sendMail("aaa@shop.com","aaa");
	}
}
