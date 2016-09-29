package com.edu.testengine.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 * Servlet implementation class sendQuery
 */
@WebServlet("/sendQuery")
public class sendQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 String to = "userto@gmail.com";//change accordingly  
	      String from = "userfrom@gmail.com";//change accordingly  
	      String host = "localhost";//or IP address  
	  */
	      
		String to = request.getParameter("");//change accordingly  
	      String from = "userfrom@gmail.com";//change accordingly  
	      String host = "localhost";//or IP address 
	      
	     //Get the session object  
	      Properties properties = System.getProperties();  
	      properties.setProperty("mail.smtp.host", host);  
	      Session session = Session.getDefaultInstance(properties);  
	  
	     //compose the message  
	      try{  
	         MimeMessage message = new MimeMessage(session);  
	         message.setFrom(new InternetAddress(from));  
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	         message.setSubject("Ping");  
	         
	         StringBuilder sb=new StringBuilder();
	         sb.append("ID : ");
	         
	         //message.setText("Hello, this is example of sending email  ");
	         
	         message.setText(sb.toString());
	  
	         // Send message  
	         Transport.send(message);  
	         System.out.println("message sent successfully....");  
	  
	      }catch (MessagingException mex) {mex.printStackTrace();}  
	   }  

}
