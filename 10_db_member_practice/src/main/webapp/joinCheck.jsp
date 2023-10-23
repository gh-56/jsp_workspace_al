<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.erser.util.*" %>
<!-- joinCheck.jsp -->

<jsp:useBean id="joinMember" class="vo.MemberVO"/>
<jsp:setProperty name="joinMember" property="*"/>
<%=joinMember %>
<% 
	System.out.println(joinMember);
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT id FROM test_member WHERE id=?";
	
	String msg = "";
	String nextPage = "";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		rs = pstmt.executeQuery();
		if(rs.next()){
			// 아이디가 일치하는 행정보가 존재 - 중복아이디
			msg = "이미 존재하는 아이디입니다.";
		}else{
			DBCPUtil.close(rs,pstmt);
			sql = "INSERT INTO test_member VALUES(null,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, joinMember.getId());
			pstmt.setString(2, joinMember.getPass());
			pstmt.setString(3, joinMember.getName());
			pstmt.setString(4, joinMember.getAddr());
			pstmt.setString(5, joinMember.getPhone());
			pstmt.setString(6, joinMember.getGender());
			pstmt.setInt(7, joinMember.getAge());
			
			int result = pstmt.executeUpdate();
			
			if(result >0){
				msg = "회원가입완료";
				nextPage = "login";
			}
		}
	}catch(Exception e){
		msg = "회원가입 실패	-" + e.getMessage();
		nextPage = "join";
	}finally{
		System.out.println(conn);
		DBCPUtil.close(conn);
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='index.jsp?page='"+nextPage+"';");
		out.println("</script>");
	}
	

%>