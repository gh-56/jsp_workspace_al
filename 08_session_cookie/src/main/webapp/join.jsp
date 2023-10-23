<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
    <!-- join.jsp -->
    <h1>JOIN PAGE</h1>
    <form action="joinCheck.jsp" method="POST">
    	<table border=1>
    		<tr>
    			<th>아이디</th>
    			<td><input type="text" name="uid" required/></td>
    		</tr>
    		<tr>
    			<th>비밀번호</th>
    			<td><input type="password" name="upw" required></td>
    		</tr>
    		<tr>
    			<th>이름</th>
    			<td><input type="text" name="uname" required></td>
    		</tr>
    		<tr>
    			<th colspan="2">
    				<button>회원가입</button>
    				<input type="reset" value="새로쓰기">
    			</th>
    		</tr>
    	</table>
    </form>
<%@ include file="common/footer.jsp" %>