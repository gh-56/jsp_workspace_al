<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<!-- 
		4대 영역(속성) 객체
		pageContext - 하나의 JSP page에만 존재
		request 	- 하나의 요청에 따른 응답 완료 시 까지 유지
		session		- 한 사용자의 브라우저 사용 종료 시 까지 유지
		application - 서버 종료 시 까지 유지
	 -->
	<%
		pageContext.setAttribute("page", "page temp");
		request.setAttribute("request", "request temp");
		session.setAttribute("session", "session temp");
		application.setAttribute("app","application temp");
		
		String pageTemp = (String)pageContext.getAttribute("page");
		String requestTemp = (String)request.getAttribute("request");
		String sessionTemp = (String)session.getAttribute("session");
		String appTemp = (String)application.getAttribute("app");
	%>
	
	<h3>page temp : <%= pageTemp %></h3>
	<h3>request temp : <%= requestTemp %></h3>
	<h3>session temp : <%= sessionTemp %></h3>
	<h3>app temp : <%= appTemp %></h3>
	<a href="response.jsp?temp=lgh">response send redirect</a>
	<br/>
	<a href="dispatcher.jsp?temp=css">dispatcher forward</a>
</body>
</html>