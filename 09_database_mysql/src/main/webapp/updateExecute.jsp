<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateExecute.jsp</title>
</head>
<body>
	<%
		String mNum = request.getParameter("num");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		int num = Integer.parseInt(mNum);
		
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(
					"UPDATE member SET name =?, addr = ? WHERE num = ?"
					);
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setInt(3, num);
			
			int result = pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('"+result+"개의 행 정보 수정');");
			out.println("location.href='memberList.jsp';");
			out.println("</script>");
			
		}catch(SQLException e){
			out.println("<script>");
			out.println("alert('수정 작업 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
		}finally{
			DBCPUtil.close(pstmt, conn);
		}
	%>
</body>
</html>