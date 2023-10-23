<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/attrTest1.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
		if(id != null){
			application.setAttribute("appId", id);
			pageContext.setAttribute("pageId", id);
		}
	%>
	<h3>request param 아이디 : <%= id %></h3>
	<h3>application scope id : <%=application.getAttribute("appId") %></h3>
	<h3>pageContext scope id : <%=pageContext.getAttribute("pageId") %></h3>
	<hr/>
	<a href="index.jsp">메인으로</a>
	<hr />
	<h3>request &amp; session 확인</h3>
	<form action="attrTest2.jsp" method="POST">
		이메일 : <input type="email" name="email" required/>
		<button>확인</button>
	</form>
</body>
</html>