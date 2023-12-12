<%@page import="com.finad23.jjj.FreeBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board_update.jsp</title>
<link rel="stylesheet" href="css/free_board_update.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="js/free_board_update.js"></script>
<jsp:useBean id="boardList" class="com.finad23.jjj.FreeBoard"
		scope="page" />
</head>
<body>
	<%
		String clickText = request.getParameter("number");
	
		// request.getParameter("number");
		//클릭한 글의 글번호 값을 받아서 저장
		ArrayList<BoardDTO> arr = boardList.getBoardList();

		BoardDTO boardDTO = null;
		for (BoardDTO selected : arr) {
			if (selected.getNumber() == Integer.parseInt(clickText)) {
				boardDTO = selected;
				break;
			}
		}
	%>
<%
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
	<form action = "free_board_update_sql.jsp?number=<%=clickText%>" method="post">
	<div id="text_header">
		<h1>자유게시판</h1>
		<table>
			<tr>
			<%
				out.println("<td colspan='6'><input type='text' name='input_name'value='" + boardDTO.getName()+"'></td>");
			%>
			</tr>
			<tr>
				<%
					out.println("<td colspan='6' id='text'><textarea name='input_text' id='editor'>" + boardDTO.getText() + "</textarea></td>");
				%>
			</tr>
		</table>
	</div>
	<div id="free_board_btn">
		<table>
			<tr>
				<td>
					<input type="submit" value="완료">
				</td>
				<td>
					<form action = "free_board.jsp"><input type="submit" value="취소"></form>
				</td>
			</tr>
		</table>		
		</div>
		</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>