<%@page import="com.erser.test.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beansResult.jsp</title>
</head>
<body>
	session member : <%=session.getAttribute("m") %>
	pageContext m : <%=pageContext.findAttribute("m") %>
	<br/>
	<hr/>
<%-- 	<%
		com.erser.test.Member ccc = (com.erser.test.Member)session.getAttribute("ccc");
		if(ccc == null){
			ccc = new com.erser.test.Member();
			session.setAttribute("ccc", ccc);
		}
	%> --%>
	<jsp:useBean id="ccc" class="com.erser.test.Member" scope="session"/>
	<%=ccc %>
	<hr/>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		
		UserBean user = new UserBean(id, pw, email, age);
		session.setAttribute("user",user);
	%>
	user : <%=session.getAttribute("user") %>
	<hr/>
	<jsp:useBean id="userBean" class="com.erser.test.UserBean" />
	<jsp:setProperty name="userBean" property="id" value="<%=id %>"/>
	<jsp:setProperty name="userBean" property="pw"/>
	<jsp:setProperty name="userBean" property="email"/>
	<jsp:setProperty name="userBean" property="age"/>
	userBean : <%= pageContext.getAttribute("userBean") %>
	
</body>
</html>