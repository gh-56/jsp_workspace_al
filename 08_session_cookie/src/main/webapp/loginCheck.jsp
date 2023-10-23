<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.erser.vo.MemberVO, java.util.*" %>
<!-- loginCheck.jsp -->
<% 
	// 로그인 요청 파아미터
	String id = request.getParameter("uid");
	String pw = request.getParameter("upw");
	
	// 로그인 상태 유지
	String userCookie = request.getParameter("userCookie");
	System.out.println("userCookie : " + userCookie);
	
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	
	// 등록된 회원 정보 없음 - 응답 method(_jspService 종료)
	if(memberList == null || memberList.isEmpty()){
		response.sendRedirect("join.jsp");
		return;
	}
	
	// 등록된 회원 정보 존재
	MemberVO loginMember = null;
	for(MemberVO member : memberList){
		if(member.getUid().equals(id) && member.getUpw().equals(pw)){
			loginMember = member;
			break;
		}
	}
	
	if(loginMember == null){
		// 일치하는 사용자가 존재하지 않음
		request.setAttribute("msg", "로그인 정보가 일치하지 않습니다.");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	} else {		
		// 인증이 완료된 상태에서 사용자가 로그인 상태 유지를 요청 했을 경우
		// 사용자를 구분할 수 있는 값을 사용자 cookie에 저장
		Cookie cookie = new Cookie("id", loginMember.getUid());
		// 현재 시간을 기준으로 얼마만큼 쿠키를 유지할 건지 seconds로 전달 
		cookie.setMaxAge(60*60*24*30);
		cookie.setPath("/");
		// 응답 객체를 통해 브라우저가 저장할 cookie 정보를 전달
		response.addCookie(cookie);
		
		// 일치하는 사용자가 존재
		session.setAttribute("loginMember", loginMember);
		response.sendRedirect(request.getContextPath());

	}
%>