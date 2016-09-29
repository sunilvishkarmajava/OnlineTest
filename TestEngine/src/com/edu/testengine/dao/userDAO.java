package com.edu.testengine.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.edu.testengine.dto.userDTO;
import com.edu.testengine.utils.CommonDAO;

public class userDAO {
	
	public ResultSet selected(String id) throws ClassNotFoundException, SQLException, ParseException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL UserDetails_CRUD(?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "SELECTED");
		stmt.setInt(2, 0);
		stmt.setString(3, id);
		stmt.setString(4, "");
		stmt.setString(5, "");
		
		 DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		 java.util.Date dd=new java.util.Date();
		 dd.setDate(2);
		 dd.setMonth(2);
		 dd.setYear(2016);
			Date dob =  df.parse(dd.toString());
		   	
			java.sql.Date sqlDate = new java.sql.Date(dob.getTime());
			
		stmt.setDate(6,sqlDate);
		
		stmt.setString(7, "");
		stmt.setString(8, "");
		stmt.setString(9, "");
		stmt.setString(10, "");
		
		ResultSet rs = stmt.executeQuery();
		return rs;
	}
	
	public static boolean register(userDTO uDTO) throws ClassNotFoundException,SQLException{
		boolean isFound=false; 
		try{
	   	  Connection con=CommonDAO.getConnection();
	   	  	CallableStatement csetmt=con.prepareCall("{call UserLogin_Insert(?,?,?,?,?,?,?,?,?,?,?)}");
	         /* PreparedStatement pstmt = con.prepareStatement("insert into registration_master(first_name,last_name,date_of_birth,user_name,password,re_enter_password) values(?,?,?,?,?,?)");*/
	   	csetmt.setString(1, uDTO.getUserName());
	   	
	   	System.out.println("in dao user name :"+uDTO.getName());
	   	csetmt.setInt(2, 3);
	   	
	   	csetmt.setString(3, uDTO.getPassword());
	   	csetmt.setString(4, uDTO.getEmail());
	   	csetmt.setString(5, uDTO.getName());
	   	csetmt.setString(6, uDTO.getGender());
	   	
	   	DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	   	
	   	//
	  DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date age =  df.parse(uDTO.getDOB());
	   	
		java.sql.Date sqlDate = new java.sql.Date(age.getTime());
		
		csetmt.setDate(7,sqlDate);
	   	//
	   	//csetmt.setDate(7,(Date)sdf.parse(uDTO.getDOB()));
	   	
	   	
	   	
	   	csetmt.setString(8, uDTO.getAddress());
	   	csetmt.setString(9, uDTO.getPhone());
	   	csetmt.setString(10, uDTO.getImagePath());
	   	csetmt.setString(11, uDTO.getInstitute_name());
	   	isFound=csetmt.execute();
			 con.close();
	      }
		 catch(Exception e)
	     {
	   	 e.printStackTrace(); 
	     }
		 return isFound;
	}
}
