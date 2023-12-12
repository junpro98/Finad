<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.finad23.DTO.BoardDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board_delete.jsp</title>
<jsp:useBean id="boardList" class="com.finad23.jjj.FreeBoard"
		scope="page" />
</head>
<body>
<%
String clickText = request.getParameter("number");
ArrayList<BoardDTO> arr = boardList.getBoardList();

BoardDTO boardDTO = null;
for (BoardDTO selected : arr) {
	if (selected.getNumber() == Integer.parseInt(clickText)) {
		boardDTO = selected;
		break;
	}
}
	
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	if (id == null || !id.equals(boardDTO.getWriter())) {
		%><script>alert("권한이 없습니다")</script><%
		return;
	}
	
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
       
        Connection connection = null;
        Statement statement = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8&useUnicode=true", "root", "123456");

            if(connection == null){
                throw new Exception("데이터베이스 연결 안됨<br>");
            }
            statement = connection.createStatement();
            int i = statement.executeUpdate("delete from freeboard WHERE freeboardNumber ='"+clickText+"';");
          									 
			
        } finally{
            try{
                statement.close();
            }catch(Exception ignored){
                
                
            }
        } try {
            connection.close();
        } catch(Exception ignored){
            
        }
        response.sendRedirect("free_board.jsp");
    %>
</body>
</html>
