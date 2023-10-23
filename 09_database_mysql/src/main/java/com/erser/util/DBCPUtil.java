package com.erser.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {
	// Database Connection Pool에서 Connection 객체 반환
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			DataSource ds = (DataSource)new InitialContext().lookup("java:comp/env/java/MySQLDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	// 사용 완료된 자원 해제
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable c : closer) {
			if(c!=null) {
				try {
					c.close();
				} catch(Exception e) {}
			}
		}
	}
	
	
}
