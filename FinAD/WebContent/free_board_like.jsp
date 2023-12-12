<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.finad23.DTO.FreeboardLikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="boardLike" class="com.finad23.jjj.FreeBoardLike" scope="page" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board_like.jsp</title>
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
    String postId = request.getParameter("number");
    String userId = id;

        Connection connection = null;
        Statement statement = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8&useUnicode=true", "root", "123456");

            if(connection == null){
                throw new Exception("데이터베이스 연결 안됨<br>");
            }
            statement = connection.createStatement();
            int i = statement.executeUpdate("insert into freeboardLike(freeboardUserID, freeboardPostID, freeboardIsLiked) values('"+  userId + "','" + postId + "', '1');");

        } finally{
            try{
                statement.close();
            }catch(Exception ignored){
                
                
            }
        } try {
            connection.close();
        } catch(Exception ignored){
            
        }
        response.sendRedirect("free_board_text.jsp?number="+postId);
    %>
</body>
</html>
