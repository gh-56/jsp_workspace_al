<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nextPage = request.getParameter("page");
	if(nextPage == null){
		nextPage = "default";
	}
	nextPage = nextPage+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
	table{
		margin:0 auto;
		text-align: center;
		border: 1px solid black;
		width: 900px;
	}
	table tr td:first-child{
		border-right:1px solid gray;
	}
	aside ul{
		padding: 0;
	}
	aside ul li{
		list-style: none;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th colspan="20" height="150">
				<jsp:include page="header.jsp"></jsp:include>
			</th>
		</tr>
		<tr>
			<td colspan="2" height="150">
				<jsp:include page="aside.jsp"></jsp:include>
			</td>
			<td width="790">
				<!-- 본문 내용 -->
				<jsp:include page="<%=nextPage %>" />
			</td>
		</tr>
		<tr>
			<th colspan="20" height="150">
				<jsp:include page="footer.jsp"></jsp:include>
			</th>
		</tr>
	</table>
</body>
</html>