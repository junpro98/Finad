<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");

	request.getParameter("mypage");
	
	if (type.equals("nomal")) {
		response.sendRedirect("mypage_nomal.jsp");
	}
	if (type.equals("influencer")) {
		response.sendRedirect("mypage_influ.jsp");
	}
	if (type.equals("company")) {
		response.sendRedirect("mypage_company.jsp");
	}
%>
