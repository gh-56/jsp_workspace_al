<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteExecute.jsp</title>
</head>
<body>
	<h1>회원정보 삭제</h1>
	<%
		String method = request.getMethod().toLowerCase();
		out.println("method 전송방식 : " + method);
		if(!method.equals("post")){
	%>
		<script>
			alert('올바른 요청이 아닙니다.');
			history.back();
		</script>
	<%
		return;
		}
		
		String mNum = request.getParameter("num");
		out.println("삭제할 회원 번호 : " + mNum);
		int num = Integer.parseInt(mNum);
		String sql = "DELETE FROM member WHERE num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		int result = pstmt.executeUpdate();	
		if(result == 1){
	%>
		<script>
			alert('회원정보 삭제');
		</script>
	<%	
		}else{
	%>
		<script>
			alert('회원정보 삭제 실패');
		</script>
	<%	
		}
	%>		
		<h3>삭제된 회원 항목 개수 - <%= result %></h3>
		<a href="index.jsp">메인으로</a>	
</body>
</html>