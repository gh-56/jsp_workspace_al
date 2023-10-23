<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>알 수 없는 오류</h1>
	<h3>다시 요청해 주세요.</h3>
	<a href="../index.jsp">메인으로 돌아가기</a>
	<%= exception.getMessage() %>
	<%
		exception.printStackTrace();
	%>
</body>
</html>