<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<%
	String mNum = request.getParameter("num");
	int num = Integer.parseInt(mNum);
	
	String sql = "SELECT * FROM member WHERE num = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	
	ResultSet rs = pstmt.executeQuery();
	
	String name = "";
	String addr = "";
	
	if(rs.next()){
		name = rs.getString("name");
		addr = rs.getString("addr");
	}
	DBCPUtil.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
	<form action="updateExecute.jsp" method="POST">
		<input type="hidden" name="num" value="<%=num %>"/>;
		<table border=1>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value=<%=name %> required/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr" value=<%=addr %> required/>
				</td>
			</tr>
			<tr>
				<th colspan=2><button>등록</button></th>
			</tr>					
		</table>
	</form>
</body>
</html>