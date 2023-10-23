package first;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login POST 요청!");
		String ip = request.getRemoteAddr();
		System.out.println("요청을 전달한 사용자 ip 주소 : " + ip);
		
		// 사용자가 작성해서 전달한 data 패킷
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		System.out.println("ID: " + uid);
		System.out.println("PASSWORD: " + upw);
		
		// 응답 처리
		// 요청 처리 후 전달되는 데이터의 타입 지정
		// MIME (Multipurpose Internet Mail Extensions)
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		pw.println("<!DOCTYPE html/>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8' />");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>입력한 아이디는 : " + uid + "</h1>");
		pw.println("<h1>입력한 비밀번호는 : " + upw + "</h1>");
		pw.println("</body>");
		pw.println("</html>");
		
	}

}
