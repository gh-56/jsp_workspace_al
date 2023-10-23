<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h3>page : <%=pageContext.getAttribute("index") %></h3>
	<h3>page : <%=request.getAttribute("index") %></h3>
	
	<!-- 
		jsp or servlet class에서 자바 코드를 이용하여
		사용자에게 출력할 페이지를 전환하는 기능
		
		1. response 응답 객체를 이용한 redirect 방법
		// 응답을 받은 브라우저에게 우리가 전달한 location 페이지로 새롭게 요청을 전달하라고 send
		
		2. request 의 RequestDispatcher를 이용한 forward 방법
		// 요청을 처리하고 나서 응답할 jsp페이지를 변경하는 방법
	 -->
	 <a href="response?id=dlrjsgh">response send redirect</a>
	 <hr/>
	 <a href="dispatcher?id=dlrjsgh">dispatcher forward</a>
</body>
</html>