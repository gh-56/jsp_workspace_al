<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/attrTest2.jsp</title>
</head>
<body>
	<%
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		if(email != null){
			request.setAttribute("reqEmail", email);
			session.setAttribute("sessionEmail", email);
		}
	%>
	<h3>request param email : <%= email %></h3>
	<h3>request param id : <%= id %></h3>
	<h2>app id : <%=application.getAttribute("appId") %></h2>
	<h2>page id : <%=pageContext.getAttribute("pageId") %></h2>
	<h2>req email : <%=request.getAttribute("reqEmail") %></h2>
	<h2>ses email : <%=session.getAttribute("sessionEmail")%></h2>
	<hr/>
	<a href="attrTest3.jsp">확인하기</a>
	
</body>
</html>