<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.erser.vo.MemberVO, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinCheck.jsp</title>
</head>
<body>
<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	String uname = request.getParameter("uname");
	
	// 전달된 parameter를 가지고 각 회원별 정보를 application 영역 객체에 저장
	MemberVO joinMember = new MemberVO(uid, upw, uname);
	List<MemberVO> memberList = (List<MemberVO>)application.getAttribute("memberList");
	// memberList가 존재하는지 확인 존재하지 않으면 등록
	if(memberList == null){
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	// 중복 아이디 체크
	boolean isCheck = false;
	for(MemberVO member : memberList){
		if(member.getUid().equals(uid)){
			isCheck = true;
			break;
		}
	}
	
	String nextPage = "";
	String message = "";
	
	if(isCheck){
		// 중복 아이디
		message = "이미 사용중인 아이디입니다.";
		nextPage = "join.jsp";
	} else {
		// 사용가능한 아이디
		memberList.add(joinMember);
		message = "회원가입 완료";
		nextPage = "login.jsp";
	}
	
	request.setAttribute("msg", message);
	
	RequestDispatcher rd = request.getRequestDispatcher(nextPage);
	rd.forward(request, response);
	
	// 등록 회원정보 확인
	System.out.println(memberList);
%>
</body>
</html>