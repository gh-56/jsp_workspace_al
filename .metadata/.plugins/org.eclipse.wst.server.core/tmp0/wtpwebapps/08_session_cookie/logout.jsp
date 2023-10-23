<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logout.jsp -->

<%
	// 현재 요청이 들어온 사용자의 sessionid 값
	String sessionid =  session.getId();
	out.println("sessionid : " + sessionid);
	
	// 새로운 요청으로 생성된 session 객체 인지 확인
	boolean isNew = session.isNew();
	out.println("isNew : " + isNew);
	
	// session 객체 최대 유지 시간 설정
	session.setMaxInactiveInterval(3600);
	
	// sesion 객체 최대 유지 시간 - seconds
	int max = session.getMaxInactiveInterval();
	out.println("max interval : " + max + "<br/>");
	
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	// session 생성 시간
	long create = session.getCreationTime();
	String time = sdf.format(create);
	out.println("creation time : " + time + "<br/>");
	
	// 현재 session의 마지막 요청 시간 - millis
	long last = session.getLastAccessedTime();
	time = sdf.format(last);
	out.println("last access time : " + time + "<br/>");
	
	// 매개밴수로 전달된 key값의 속성 값을 삭제
	session.removeAttribute("loginMember");
	
	// 쿠키에 등록된 로그인 상태 유지 정보 삭제
	Cookie cookie = new Cookie("id", "");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	
	// welcome page로 이동
	response.sendRedirect(request.getContextPath());
%>