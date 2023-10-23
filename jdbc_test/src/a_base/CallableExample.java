package a_base;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CallableExample {

	public static void main(String[] args) {
		// info_sal_over
		String url = "jdbc:mysql://localhost:3306/develop_sql";
		String user = "root";
		String password = "12345";
		
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "CALL info_sal_over(?)";
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, 1600);
			rs = cstmt.executeQuery();
			
			while(rs.next()) {
				String empno = rs.getString(1);
				String ename = rs.getString(2);
				java.util.Date hiredate = rs.getDate(3);
				int sal = rs.getInt(4);
				System.out.print(empno+ ":");
				System.out.print(ename+ ":");
				System.out.print(hiredate+ ":");
				System.out.println(sal);
			}
			
			System.out.println("연결 성공 : " + conn);
		} catch (SQLException e) {
			System.out.println("연결 실패: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (SQLException e) {}
			try {
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {}
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {}
			
		}

	}

}
