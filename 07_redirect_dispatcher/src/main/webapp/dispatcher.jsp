<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dispatcher.jsp</title>
</head>
<body>
	<h3>dispatcher forward</h3>
	<%
		String temp = request.getParameter("temp");
		pageContext.setAttribute("pageTemp", temp);
		request.setAttribute("requestTemp", temp);
		session.setAttribute("sessionTemp", temp);
		application.setAttribute("appTemp", temp);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
	%>
</body>
</html>