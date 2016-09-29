package com.edu.testengine.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.edu.testengine.utils.CommonDAO;

public class roleDAO {
	public ResultSet select() throws ClassNotFoundException, SQLException, ParseException{
		Connection con= CommonDAO.getConnection();
		
		String query = "{CALL roles_CRUD(?,?,?)}";
		CallableStatement stmt = con.prepareCall(query);
		stmt.setString(1, "SELECT");
		stmt.setInt(2, 0);
		stmt.setString(3, "");
		ResultSet rs = stmt.executeQuery();
		return rs;
	}
	
}
