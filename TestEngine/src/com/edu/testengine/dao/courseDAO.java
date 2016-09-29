package com.edu.testengine.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.edu.testengine.dto.courseDTO;
import com.edu.testengine.utils.CommonDAO;

public class courseDAO {
	
	public ResultSet select() throws ClassNotFoundException, SQLException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL Course_CRUD(?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "SELECT");
		stmt.setInt(2, 0);
		stmt.setString(3, "");
		stmt.setString(4, "");
		stmt.setString(5, "");
		ResultSet rs = stmt.executeQuery();
		return rs;
	}
	public boolean insert(courseDTO course) throws ClassNotFoundException, SQLException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL Course_CRUD(?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "INSERT");
		stmt.setInt(2, 0);
		stmt.setString(3, course.getTitle());
		stmt.setString(4, course.getDetails());
		stmt.setString(5, course.getImagePath());
		boolean rs = stmt.execute();
		return rs;
	}
	public boolean update(courseDTO course) throws ClassNotFoundException, SQLException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL Course_CRUD(?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "UPDATE");
		stmt.setInt(2, course.getCourseID());
		stmt.setString(3, course.getTitle());
		stmt.setString(4, course.getDetails());
		stmt.setString(5, course.getImagePath());
		boolean rs = stmt.execute();
		return rs;
	}
	public boolean delete(courseDTO course) throws ClassNotFoundException, SQLException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL Course_CRUD(?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "DELETE");
		stmt.setInt(2, course.getCourseID());
		stmt.setString(3, course.getTitle());
		stmt.setString(4, course.getDetails());
		stmt.setString(5, course.getImagePath());
		boolean rs = stmt.execute();
		
		return rs;
	}
	/*
	public boolean insert(courseDTO coursedto){
		boolean isFound=false; 
		try{
	   	  Connection con=CommonDAO.getConnection();
	   	  	CallableStatement csetmt=con.prepareCall("{call Course_CRUD(?,?,?,?,?)}");
	   	csetmt.setString(1,"INSERT");
	   	csetmt.setInt(2, 0);
	   	csetmt.setString(3, coursedto.getImagePath());
	   	csetmt.setString(4, coursedto.getTitle());
	   	csetmt.setString(5, coursedto.getDetails());
	   	isFound=csetmt.execute();
		 con.close();
     }
	 catch(Exception e)
    {
  	 e.printStackTrace(); 
    }
	 return isFound;
		
	}
	*/
}
