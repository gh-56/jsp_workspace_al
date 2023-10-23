<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response.jsp</title>
</head>
<body>
	<h2>response.jsp</h2>
	<%
		String temp = request.getParameter("temp");
		pageContext.setAttribute("pageTemp", temp);
		request.setAttribute("requestTemp", temp);
		session.setAttribute("sessionTemp", temp);
		application.setAttribute("appTemp", temp);
		// 브라우저를 통해서 result.jsp로 새로운 요청 전달
		response.sendRedirect("result.jsp");
		
	%>
</body>
</html>