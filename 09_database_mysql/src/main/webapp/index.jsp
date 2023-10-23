<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>database connection test</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/develop_sql";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try{
			Class.forName(driver);
			out.println("Driver Class가 존재합니다.");
			conn = DriverManager.getConnection(url,username, password);
			out.println("DB 연결 완료 : " + conn);
		}catch(ClassNotFoundException e){
			out.println("Driver Class를 찾을 수 없습니다.");
		}catch(SQLException e){
			out.println("연결 요청 정보 오류 : " + e.getMessage());
		}finally {
			if(conn!=null){
				conn.close();
			}
		}
	%>
	<br/><hr/>
	<h1>DataSource</h1>
	<%@ page import="javax.sql.DataSource" %>
	<%@ page import="javax.naming.Context" %>
	<%@ page import="javax.naming.InitialContext" %>
	
	<%
		Context context = new InitialContext();
		// JNDI (Java Naming and Directory Interface)
		// 디렉토리 서비스에서 제공하는 데이터 및 객체를 발견하고 참조하기 위한 표준 API
		DataSource ds = (DataSource)context.lookup("java:comp/env/java/MySQLDB");
		conn = ds.getConnection();
		out.println("dataSource conn : " + conn);
		
		if(conn != null) conn.close();
	%>
	<br/>
	<hr/>
	<a href="insertForm.jsp">회원 정보 입력</a>
	<br/>
	<a href="memberList.jsp">회원 목록</a>
</body>
</html>