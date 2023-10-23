<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest3.jsp</title>
</head>
<body>
	<h2>app id : <%=application.getAttribute("appId") %></h2>
	<h2>page id : <%=pageContext.getAttribute("pageId") %></h2>
	<h2>req email : <%=request.getAttribute("reqEmail") %></h2>
	<h2>ses email : <%=session.getAttribute("sessionEmail")%></h2>
	<hr/>
	<a href="index.jsp">메인으로</a>
</body>
</html>