<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
    <!-- login.jsp -->
    <h1>LOGIN PAGE</h1>
    <form action="loginCheck.jsp" method="POST">
    	<table border="1">
    		<tr>
    		 <th>아이디</th>
    		 <td>
    		 	<input type="text" name="uid" required/>
    		 </td>
    		</tr>
    		<tr>
    		 <th>비밀번호</th>
    		  <td>
    		 	<input type="password" name="upw" required/>
    		  </td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<label>
    					<input type="checkbox" name="userCookie" value="cookie"/>
    					로그인 상태 유지
    				</label>
    			</td>
    		</tr>
    		<tr>
    			<th colspan="2"><button>로그인</button></th>
    		</tr>
    	</table>
    </form>
<%@ include file="common/footer.jsp" %>