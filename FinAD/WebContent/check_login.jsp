<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String userType = request.getParameter("user_grade");
	String type = null;
	String check = null;
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	if (id == null || id.trim().isEmpty() || password == null || id.trim().isEmpty()) {
		response.sendRedirect("login.jsp");
		return;
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "123456");
		if(connection == null) {
			throw new Exception("데이터베이스 연결 안됨");
		}
		statement = connection.createStatement();
		
		
		if("nomal".equals(userType)) {
			check = "select nomalUserId, password from project.nomal_user where nomalUserId = '" + id + "' and password = '" + password + "';";
			type = "nomal";
		} else if("influencer".equals(userType)) {
			check = "select influUserId, password from project.user where influUserId = '" + id + "' and password = '" + password + "';";
			type = "influencer";
		} else if("company".equals(userType)) {
			check = "select companyId, password from project.company where companyId = '" + id + "' and password = '" + password + "';";
			type = "company";
		} else {
			%>
			<script>
				alert("회원 종류를 선택해주세요.");
				location.href="login.jsp";
			</script>
			<%
			return;
		}
		
		resultSet = statement.executeQuery(check);
		
	    if(resultSet.next()) {
	    	session.setAttribute("id", id);
	    	session.setAttribute("password", password);
			session.setAttribute("type", type);
%>
		<script>
		location.href="main.jsp";
		</script>
<% 
		} else {
%>
			<script>
			alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인해주세요");
			location.href="login.jsp";
			</script>
<%
		}
	} finally {
		try {
			statement.close();
		} catch (Exception ignored) {
		}
	 try  {
		connection.close();
	} catch (Exception ignored) {
	}
	}
%>