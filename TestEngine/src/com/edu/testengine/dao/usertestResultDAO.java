package com.edu.testengine.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.edu.testengine.dto.testDTO;
import com.edu.testengine.dto.testQuestionDTO;
import com.edu.testengine.dto.usertestResultDTO;
import com.edu.testengine.utils.CommonDAO;

public class usertestResultDAO {
	public boolean insert(usertestResultDTO test) throws ClassNotFoundException, SQLException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL UserTestResults_CRUD(?,?,?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "INSERT");
		stmt.setInt(2, test.getResultid());		//testID
		stmt.setString(3, test.getUserName());	//facultyid
		stmt.setInt(4, test.getTestid()); //courseid
		stmt.setInt(5,test.getMarks());
		
		ResultSet rs=stmt.executeQuery();
		int id=0;
		if(rs.next()){
			id=rs.getInt(1);
		}
		boolean result =false;
		if(id>0){
			result=true;
		}
		return result;
	}
}
