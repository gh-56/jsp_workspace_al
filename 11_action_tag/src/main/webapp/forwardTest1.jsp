<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest1.jsp</title>
</head>
<body>
	<h1>이동된 페이지(forwardTest1.jsp)</h1>
	이름 : <%=request.getParameter("name") %> <br/>
	나이 : <%=request.getParameter("age") %> <br/>
	TEL : <%=request.getParameter("tel") %> <br/>
	<hr/>
	<a href="includeTest1.jsp?page=includeTest2.jsp">include test</a>
	<br/>
</body>
</html>