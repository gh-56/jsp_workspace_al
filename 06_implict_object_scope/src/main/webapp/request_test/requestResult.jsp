<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestResult.jsp</title>
</head>
<body>
	
	<%
		// request로 전달된 데이터를 처리할 언어셋
		String encoding = request.getCharacterEncoding();
		out.println("encoding : " + encoding + "<br/>");
		
		// tomcat9 이하 - 인코딩방식을 직접 지정
		// tomcat10 이상은 web.xml에 UTF-8로 정의되어 있음
		request.setCharacterEncoding("utf-8");
		encoding = request.getCharacterEncoding();
		out.println("encoding : " + encoding + "<br/>");
		
		// 요청이 전달된 client의 원격자 아이피 주소
		String ip = request.getRemoteAddr();
	%>
	아이피 주소 : <%= ip %> <br/>
	
	<%
		String name = request.getParameter("name");
	%>
	이름 : <%= name %> <br/>
	
	<%
		// 요청 전송 방식
		String method = request.getMethod();
		out.println("전송방식 : " + method + "<br/>");
		
		// 요청 경로 - 현재 서버의 프로젝트 별 전체 요청 경로
		String requestURI = request.getRequestURI();
		out.println("uri : " + requestURI + "<br/>");
		
		// 주소 표시줄의 URL 정보
		StringBuffer requestURL = request.getRequestURL();
		out.println("url : " + requestURL + "<br/>");
		
		// 서버 도메인 or ip
		String serverName = request.getServerName();
		out.println("서버 이름 : " + serverName + "<br/>");
		
		// 서버가 서비스 제공중인 포트 번호
		int serverPort = request.getServerPort();
		out.println("서버 포트 : " + serverPort + "<br/>");
		
		// 현재 요청 프로젝트 경로
		String contextPath = request.getContextPath();
		out.println("contextPath : " + contextPath + "<br/>");
		
		// get 방식의 요청 파라미터
		String queryString = request.getQueryString();
		out.println("쿼리스트링 : " + queryString + "<br/>");
		
		// 요청 content type
		String contentType = request.getContentType();
		out.println("contentType : " + contentType + "<br/>");
		
		// request parameter
		String gender = request.getParameter("gender");
		// 선택된 radio 버튼의 value 값
		out.println("gender : " + gender + "<br/>");
		
		String[] hobbys = request.getParameterValues("hobby");
		out.println("hobbys : " + Arrays.toString(hobbys) + "<br/>");
		
		out.println("<h3>PARAMETER NAMES</h3>");
		Enumeration<String> names = request.getParameterNames();
		// 읽어올 요소가 존재하면 true , 없으면 false
		while(names.hasMoreElements()){
			String keyName = names.nextElement();
			out.println("key name : " + keyName + "&nbsp;&nbsp;");
		}
		
		out.println("<h3>parameter 묶음</h3>");
		Map<String, String[]> map = request.getParameterMap();
		for(String key : map.keySet()){
			String[] values = map.get(key);
			out.println(key+":"+Arrays.toString(values)+"<br/>");
		}
	%>
	
</body>
</html>