<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest2.jsp</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String result = request.getParameter("resultPage");
	%>
	name : <%=name %> <br/>
	age : <%=age %>
	<jsp:forward page="<%=result %>">
		<jsp:param name="tel" value="010-1234-5678"/>
	</jsp:forward>
</body>
</html>