<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	
 	request.getParameter("logout");
 	
	if (request.getParameter("logout") != null) {
		session.removeAttribute("id");
		session.removeAttribute("password");
		session.removeAttribute("type");
		response.sendRedirect("main.jsp");
	}
	
%>