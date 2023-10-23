<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.*" %> --%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_info_import.jsp</title>
</head>
<body>
<!-- 02_info_import.jsp -->
	<%@ page info="Date Class를 이용한 시간 정보 출력" %>
	Today is <%= new Date() %> <br/>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat(
				"yyyy-MM-dd E HH:mm:ss"
				);
		String date = sdf.format(new Date());
	%>
	<%= date %>
	<br/>
	<%= getServletInfo() %>
</body>
</html>