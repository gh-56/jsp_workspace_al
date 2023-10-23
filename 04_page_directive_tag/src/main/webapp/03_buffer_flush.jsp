<!-- buffer="8kb" autoFlush="true" -->
<%@ page buffer="1kb" autoFlush="true" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_buffer_flush.jsp</title>
</head>
<body>
	<!-- 03_buffer_flush.jsp -->
	<!-- 전체 버퍼 크기 -->
	Buffer size = <%= out.getBufferSize() %><br/>
	<!-- 버퍼에 남은 크기, 잔존하는 크기 -->
	Remaining size = <%= out.getRemaining() %> <br/>
	<hr/>
	<%
		for(int i=0; i<1000; i++){
			out.println("   1234   ");
			int bytes = out.getRemaining();
			out.println("("+bytes+")");
		}
	%>
	<br/>
	Remaining size = <%= out.getRemaining() %> <br/>
</body>
</html>