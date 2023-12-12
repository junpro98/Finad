<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board_search_sql.jsp</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		if (id == null && password == null) {
	%>
	<jsp:include page="header_login.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="header_logout.jsp"></jsp:include>
	<%
		}
	%>
	<%
		String searchType = request.getParameter("searchType");
		String searchQuery = request.getParameter("searchQuery");

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/project?characterEncoding=utf-8&useUnicode=true", "root",
					"123456");

			if (connection == null) {
				throw new Exception("데이터베이스 연결 안됨<br>");
			}
			statement = connection.createStatement();
			if (searchQuery.equals("title") && !searchQuery.trim().isEmpty()) {
				resultSet = statement.executeQuery("select * from project.freeboard where freeboardName = " + searchQuery);
			}
			if (searchQuery.equals("text") && !searchQuery.trim().isEmpty()) {
				resultSet = statement.executeQuery("select * from project.freeboard where freeboardText =" +searchQuery );
			}
			if (searchQuery.equals("all") && !searchQuery.trim().isEmpty()) {
			    String formattedQuery = searchQuery.trim();
			    resultSet = statement.executeQuery("SELECT * FROM project.freeboard WHERE freeboardName LIKE '%" + formattedQuery + "%' OR freeboardText LIKE '%" + formattedQuery + "%'");
			}

		} finally {
			try {
				statement.close();
			} catch (Exception ignored) {

			}
		}
		try {
			connection.close();
		} catch (Exception ignored) {

		}
		response.sendRedirect("free_board.jsp?searchType=" + searchType + "searchQuery" + searchQuery);
	%>
</body>
</html>