package com.edu.testengine.utils;

public class CommonSQLConstants {
	public static String LOGIN_SQLADMIN="select roles.roleid, roles.rolename, userlogin.Email from userlogin, roles where Username=? and Password=? and userlogin.roleId = roles.roleId";
}
