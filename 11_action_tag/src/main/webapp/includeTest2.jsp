<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String str = "test variable"; %>
<% String name = request.getParameter("name"); %>
<hr/>
<h1>여기는 include test2 JSP입니다.</h1>
<h2> param : <%=name %></h2>