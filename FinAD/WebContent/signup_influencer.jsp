<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); // 한글 데이터 인코딩 설정
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String nickname = request.getParameter("nickname");
		String post = request.getParameter("post");
		String addr = request.getParameter("addr");
		String addr_more = request.getParameter("addr_more");
		String reference = request.getParameter("reference");
		String phone = request.getParameter("phone");
		String input_phone = request.getParameter("input_phone");
		String email = request.getParameter("email");
		String category[]	= request.getParameterValues("categori");
		String tag = request.getParameter("tag");
		String category2 = "";
		
		if(gender.equalsIgnoreCase("man")) {
			gender = "man";
		} else {
			gender = "woman";
		}

		if(phone.equalsIgnoreCase("SKT")) {
			phone = "SKT";
		} else if(phone.equalsIgnoreCase("KT")) {
			phone = "KT";
		} else if(phone.equalsIgnoreCase("LG")) {
			phone = "LG";
		} else {
			phone = "good";
		}
		
		if(category != null) {
			for(int j = 0; j < category.length; j++) {
				category2 += category[j];
				if (j < category.length - 1) {
					category2 += ",";
	            }
			}
		}
		Connection connection = null;
		Statement statement = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8&useUnicode=true", "root", "123456");
			if(connection == null) {
				throw new Exception("데이터베이스 연결 안됨<br>");
			}
			statement = connection.createStatement();
			int i = statement.executeUpdate("insert into user(influUserId, password, name, sex, eMail, nickName, newsAgency, mobileNumber, category, post, address, addr_more, reference) values ('" + id + "','" + pw + "','" + name + "','" + gender + "','" + email + "','" + nickname + "','" + phone + "','" + input_phone + "','" + category2 + "','" + post + "','" + addr + "','" + addr_more + "','" + reference + "');");
			
		} finally {
			try {
				statement.close();
			} catch (Exception ignored) {
				
			}
		} try {
			connection.close();
		} catch (Exception ignored) {
			
		}
		response.sendRedirect("signup_final.jsp");
	%>
</body>
</html>