<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertForm.jsp</title>
</head>
<body>
	<form action="insertExecute.jsp" method="POST">
		<table border=1>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" required/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr" required/>
				</td>
			</tr>
			<tr>
				<th colspan=2><button>등록</button></th>
			</tr>					
		</table>
	</form>
</body>
</html>