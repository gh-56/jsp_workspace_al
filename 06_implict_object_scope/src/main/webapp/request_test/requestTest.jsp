<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest.jsp</title>
</head>
<body>
 <!--
 enctype="application/x-www-form-urlencoded"
 enctype="multipart/form-data"
 -->
	<form action="requestResult.jsp" method="post">
		이름 : <input type="text" name="name" /> <br/>
		성별 : <input type="radio" name="gender" value="male"/> 남 
		<input type="radio" name="gender" value="female"/> 여 <br/>
		취미 : <input type="checkbox" name="hobby" value="축구"/> 축구 
		<input type="checkbox" name="hobby" value="JAVA"/> JAVA
		<input type="checkbox" name="hobby" value="JSP"/> JSP
		<input type="checkbox" name="hobby" value="여행"/> 여행 <br/>
		
		<button>확인</button>
	</form>
</body>
</html>