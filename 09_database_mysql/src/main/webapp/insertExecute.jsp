<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.erser.util.DBCPUtil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertExecute.jsp</title>
</head>
<body>
	<h1>DBCP CONNECTION &amp; INSERT TEST</h1>
	
	<%
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = DBCPUtil.getConnection();
		try{
			pstmt = conn.prepareStatement("INSERT INTO member(name,addr) VALUES(?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			int result = pstmt.executeUpdate();
			if(result>0){
				out.println("회원정보 등록 완료");
			} else{
				out.println("회원정보 등록 실패");
			}
			out.println("-"+ result);
		}catch(SQLException e){
			out.println("<h3>DB 작업 수행 실패</h3>");
			out.println("<h3>"+e.toString()+"</h3>");
		}finally{
			DBCPUtil.close(pstmt, conn);
		}
	%>
	<br/>
	<a href="index.jsp">메인으로</a>
</body>
</html>