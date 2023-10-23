<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h3>result page</h3>
	<%
		String pageTemp = (String)pageContext.getAttribute("page");
		String requestTemp = (String)request.getAttribute("request");
		String sessionTemp = (String)session.getAttribute("session");
		String appTemp = (String)application.getAttribute("app");
	%>
	
	<h3>page temp : <%= pageTemp %></h3>
	<h3>request temp : <%= requestTemp %></h3>
	<h3>session temp : <%= sessionTemp %></h3>
	<h3>app temp : <%= appTemp %></h3>
	<hr/>
	<h4>temp page : <%= pageContext.getAttribute("pageTemp") %></h4>
	<h4>temp request : <%= request.getAttribute("requestTemp") %></h4>
	<h4>temp session : <%= session.getAttribute("sessionTemp") %></h4>
	<h4>temp application : <%= application.getAttribute("appTemp") %></h4>
	
	<hr/>
	<a href="index.jsp">main</a>
	
</body>
</html>