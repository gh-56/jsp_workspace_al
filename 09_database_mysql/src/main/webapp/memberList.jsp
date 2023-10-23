<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.erser.util.DBCPUtil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<body>
	<%
		Connection conn = DBCPUtil.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM member ORDER BY num DESC";
		ResultSet rs = stmt.executeQuery(sql);
	%>
	<h1>등록된 회원 목록</h1>
	<table border=1>
		<tr>
			<th colspan="4">회원정보</th>
		</tr>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		<%
			while(rs.next()){
				int num = rs.getInt("num"); // 1
				String name = rs.getString("name"); // 2
				String addr = rs.getString("addr"); // 3
		%>
		<%--<tr onclick="alert(<%=num%>);"> --%>
		 <tr onclick="location.href='updateForm.jsp?num=<%=num%>';" title="회원정보 수정">
			<td><%=num %></td>
			<td><%=name %></td>
			<td><%=addr %></td>
			<td>
				<form action="deleteExecute.jsp" method="POST">
					<input type="hidden" name="num" value="<%=num %>"/>
					<button>삭제</button>
				</form>
			</td>
		</tr>
		<%
			}
			DBCPUtil.close(rs, stmt, conn);
		%>
	</table>
	<hr/>
	<a href="index.jsp">메인으로</a>
</body>
</html>