<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error/null_error.jsp</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		out.println("param name: " + name+"<br/>");
		String age = request.getParameter("age");
		int ageNum = Integer.parseInt(age);
		out.println(ageNum);
	%>
</body>
</html>