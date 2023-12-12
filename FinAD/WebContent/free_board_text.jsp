<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.finad23.DTO.FreeboardCommentDTO"%>
<%@page import="com.finad23.jjj.FreeBoardComment"%>
<%@page import="com.finad23.jjj.FreeBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.BoardDTO"%>
<%@ page import="com.finad23.DTO.FreeboardLikeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board_text.jsp</title>
<link rel="stylesheet" href="css/free_board_text.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/free_board_text.js"></script>
<jsp:useBean id="boardList" class="com.finad23.jjj.FreeBoard"
	scope="page" />
<jsp:useBean id="boardLike" class="com.finad23.jjj.FreeBoardLike"
	scope="page" />
<jsp:useBean id="boardComment" class="com.finad23.jjj.FreeBoardComment"
	scope="page" />
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String clickText = request.getParameter("number"); //클릭한 글의 글번호 값을 받아서 저장

		ArrayList<BoardDTO> arr = boardList.getBoardList();

		BoardDTO boardDTO = null;
		for (BoardDTO selected : arr) {
			if (selected.getNumber() == Integer.parseInt(clickText)) {
				boardDTO = selected;
				break;
			}
		}

		ArrayList<FreeboardLikeDTO> arre = boardLike.getBoardList(id, clickText);

		FreeboardLikeDTO freeboardLikeDTO = null;

		for (FreeboardLikeDTO selected : arre) {
			if (selected.getPostID() == Integer.parseInt(clickText)) {
				freeboardLikeDTO = selected;
				break;
			}
		}
		
		int commentCnt=0;
		ArrayList<FreeboardCommentDTO> freeboardCommentDTO = boardComment.getBoardList(clickText);
	    commentCnt = freeboardCommentDTO.size(); // 댓글 리스트의 크기를 commentCnt에 할당
	%>
	<%
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

	<div id="text_header">
		<h1>자유게시판</h1>
		<table>
			<tr>
				<%
					out.println("<td class='title' colspan='6'>" + boardDTO.getName() + "</td>");
				%>
			</tr>
			<tr id="text_info">
				<%
					out.println("<td class='title'>" + boardDTO.getWriter() + "</td>");
					out.println("<td>" + boardDTO.getDate() + "</td>");
				%>
				<td></td>
				<td>조회(<%= boardDTO.getView() %>)</td>
				<td>추천(<%= boardDTO.getLike() %>)</td>
				<td>댓글(<%= commentCnt %>)</td>
			</tr>
			<tr>
				<%
					out.println("<td colspan='6' id='text'>" + boardDTO.getText() + "</td>");
				%>
			</tr>
			<tr>
				<td colspan='6'>
					<%
						if (id != null) {
							if (freeboardLikeDTO != null) {
					%>
					<div class="voting-buttons">
						<button class="vote-button" id="upvote-button"
							onclick="relikeButton(<%=clickText%>)">

							<img src="img/d_clicked.png" width="50px" height="50px"
								id="like_img" alt="추천">
						</button>
					</div> <%
 	} else {
 %>


					<div class="voting-buttons">
						<button class="vote-button" id="upvote-button"
							onclick="likeButton(<%=clickText%>)">

							<img src="img/d.png" width="50px" height="50px" id="like_img"
								alt="추천">
						</button>
					</div> <%
 	}
 	}
 %> <%
 	
 %>
				</td>
			</tr>
		</table>
	</div>


	<table id="free_board_comment_list">
			<%
			commentCnt = 0;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //날짜 포맷 설정
			ArrayList<FreeboardCommentDTO> freeboardCommentDTOs = boardComment.getBoardList(clickText);
			for (int i = 0; i < freeboardCommentDTO.size(); i++) {

				Date date = simpleDateFormat.parse(freeboardCommentDTO.get(i).getCreatedAt());  //db에서 받아온 날짜를 형변환해서 str -> date 저장
				String formattedDate = simpleDateFormat.format(date); 	//저장된 날짜를 설정된 날짜 포맷으로 변경
				String textWithBreaks = freeboardCommentDTO.get(i).getText().replace("\n", "<br>");
				out.println("<tr>");
				out.println("<td>" + (i + 1) + "</td>");
				out.println("<td>" + freeboardCommentDTO.get(i).getUserID() + "</td>");
				out.println("<td>" + textWithBreaks + "</td>");
				out.println("<td>" + formattedDate + "</td>"); //설정된 날짜 포맷 출력
				out.println("</tr>");
				commentCnt++;
			}
			out.println("<h4>댓글(" + commentCnt +")</h4>");
		%>

	</table>


	<%
		if (id != null && password != null) {
	%>
	<div id="free_board_comment">
		<form action="free_board_comment_sql.jsp"
			onsubmit="return checkComment()">
			<table>
				<tr>
					<td><textarea name="input_comment" id="input_comment"></textarea></td>
					<td><input type="hidden" name="input_number"
						value="<%=clickText%>"></td>

					<td><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
		<%
			}
		%>

	</div>
	<div id="free_board_btn">
		<table>
			<tr>
				<%
					if (id != null && id.equals(boardDTO.getWriter())) {
				%>
				<td>
					<form action="free_board_update.jsp?number=<%=clickText%>"
						method="post">
						<input type="submit" value="수정">
					</form>
				</td>

				<td>
					<form action="free_board_delete.jsp?number=<%=clickText%>"
						method="post" onsubmit="return check()">
						<input type="submit" value="삭제">
					</form>
				</td>
				<%
					} else {
				%><style>
#free_board_btn {
	margin-top: 10px;
	margin-left: 1515px;
}
</style>
				<%
					}
				%>
				<td>
					<form action="free_board.jsp">
						<input type="submit" value="목록">
					</form>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>