<%@page import="com.finad23.jjj.FreeBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>free_board_write.jsp</title>
    <link rel="stylesheet" href="css/free_board_write.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
    <script type="text/javascript" src="js/free_board_write.js"></script>
    <jsp:useBean id="boardList" class="com.finad23.jjj.FreeBoard" scope="page" />
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
	<div id="write_container">
		<form action="free_board_write_sql.jsp" name="form" onsubmit="return check_name()" autocomplete="off">
			<input type="text" name="input_name" id="input_name" placeholder="제목" value="">
			<textarea name="input_text" id="editor"></textarea>
			<input type="submit" value="완료"placeholder="내용">
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>