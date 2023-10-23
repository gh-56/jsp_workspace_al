package com.erser.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RedirectServlet() {
		System.out.println("RedirectServlet 생성자 호출!!");
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RESPONSE SERVICE 호출!!");
		// super.service(request, response);
		String method = request.getMethod();
		if(method.toLowerCase().equals("get")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}
		String id = request.getParameter("id");
		System.out.println("parameter id : " + id);
		request.setAttribute("response", "sample data");
		// response.sendRedirect("response.jsp");
		response.setStatus(302);
		response.setHeader("location", "response.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RESPONSE DO GET 호출!!");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RESPONSE DO POST 호출!!");
	}

}
