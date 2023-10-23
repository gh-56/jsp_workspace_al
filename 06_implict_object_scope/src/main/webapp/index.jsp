<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<a href="request_test/requestTest.jsp">request method 확인</a> <br/>
	
	<a href="attrForm.jsp">속성-영역 객체 테스트</a> <br/>
	
	<%
		String appId = (String)application.getAttribute("appId");
		String pageId = (String)pageContext.getAttribute("pageId");
	%>
	<h3>application id : <%=appId %></h3>
	<h3>pageContext id : <%=pageId %></h3>
	<h2>req email : <%=request.getAttribute("reqEmail") %></h2>
	<h2>ses email : <%=session.getAttribute("sessionEmail")%></h2>
	<hr/>
	<%
		pageContext.setAttribute("index", "page test data");
		request.setAttribute("index", "request test data");
	%>
	
	<h3>page : <%=pageContext.getAttribute("index") %></h3>
	<h3>page : <%=request.getAttribute("index") %></h3>
	<a href="result.jsp">result</a>
</body>
</html>