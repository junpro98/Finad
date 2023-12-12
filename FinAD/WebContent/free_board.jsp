<%@page import="java.util.ArrayList"%>
<%@page import="com.finad23.VO.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free_board.jsp</title>
<link rel="stylesheet" href="css/free_board.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/free_board.js"></script>
<script>

var id = '<%=session.getAttribute("id")%>';
var password = '<%=session.getAttribute("password")%>';

	function check_login() {
		if (id == 'null' || password == 'null') {
			alert("로그인 후 이용하실 수 있습니다.");
			return false;
		}
		return true;
	}
</script>

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
	<jsp:useBean id="boardList" class="com.finad23.jjj.FreeBoard"
		scope="page" />
	<jsp:useBean id="boardListHits" class="com.finad23.jjj.FreeBoardHits"
		scope="page" />
	<jsp:useBean id="boardListLikes"
		class="com.finad23.jjj.FreeBoardLikeTop5" scope="page" />
	<jsp:useBean id="boardListSearch"
		class="com.finad23.jjj.FreeBoardSearch" scope="page" />

	<div id="table_header">
		<h1>자유게시판</h1>
		<table id="main_table">
			<tr id="sss">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
			<%
				String searchType = request.getParameter("searchType");
				String searchQuery = request.getParameter("searchQuery");

				int boardSize = 0;
				

				if (searchQuery != null) {
					ArrayList<BoardDTO> boardDTO = boardListSearch.getBoardList(searchType, searchQuery);
					boardSize = boardDTO.size();
					int itemsPerPage = 15; // 페이지당 아이템 수
					int totalItems = boardDTO.size(); // 총 아이템 수
					int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); // 전체 페이지 수
					int currentPage = 1; // 현재 페이지, 기본값은 1로 설정
					if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
					}
					int startIndex = (currentPage - 1) * itemsPerPage;
					int endIndex = Math.min(currentPage * itemsPerPage, totalItems);

					for (int i = startIndex; i < endIndex; i++) {
						int number = boardDTO.get(i).getNumber();
						String writer = boardDTO.get(i).getWriter();
						String name = boardDTO.get(i).getName();
						String date = boardDTO.get(i).getDate();
						int view = boardDTO.get(i).getView();
						int like = boardDTO.get(i).getLike();
						out.println("<tr>");
						out.println("<td>" + number + "</td>");
						out.println("<td><a href='free_board_text.jsp?number=" + number + "' onclick='views(" + number
								+ ")'>" + name + "</td>");
						out.println("<td>" + writer + "</td>");
						out.println("<td>" + date + "</td>");
						out.println("<td>" + view + "</td>");
						out.println("<td>" + like + "</td>");
						out.println("</tr>");

					}
				} else if (searchQuery == null) {
					ArrayList<BoardDTO> boardDTO = boardList.getBoardList();
					boardSize = boardDTO.size();
					int itemsPerPage = 15; // 페이지당 아이템 수
					int totalItems = boardDTO.size(); // 총 아이템 수
					int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); // 전체 페이지 수
					int currentPage = 1; // 현재 페이지, 기본값은 1로 설정
					if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
					}
					int startIndex = (currentPage - 1) * itemsPerPage;
					int endIndex = Math.min(currentPage * itemsPerPage, totalItems);

					for (int i = startIndex; i < endIndex; i++) {
						int number = boardDTO.get(i).getNumber();
						String writer = boardDTO.get(i).getWriter();
						String name = boardDTO.get(i).getName();
						String date = boardDTO.get(i).getDate();
						int view = boardDTO.get(i).getView();
						int like = boardDTO.get(i).getLike();
						out.println("<tr>");
						out.println("<td>" + number + "</td>");
						out.println("<td><a href='free_board_text.jsp?number=" + number + "' onclick='views(" + number
								+ ")'>" + name + "</td>");
						out.println("<td>" + writer + "</td>");
						out.println("<td>" + date + "</td>");
						out.println("<td>" + view + "</td>");
						out.println("<td>" + like + "</td>");
						out.println("</tr>");

					}
					
				}
			%>
			
		</table>
		<table id="rank1_table">
			<tr>
				<td colspan="4"><h2>실시간 조회수 Top5</h2></td>
			</tr>
			<%
				ArrayList<BoardDTO> boardDTOHits = boardListHits.getBoardHitsList();
				int cnt = 0;
				for (int i = 0; i < 5; i++) {
					cnt++;
					out.println("<tr>");
					out.println("<td>" + cnt + "</td>");
					out.println("<td><a href='free_board_text.jsp?number=" + boardDTOHits.get(i).getNumber()
							+ "' onclick='views(" + boardDTOHits.get(i).getNumber() + ")'>" + boardDTOHits.get(i).getName()
							+ "</td>");
					out.println("<td>" + boardDTOHits.get(i).getView() + "</td>");
					out.println("<td>" + boardDTOHits.get(i).getLike() + "</td>");
					out.println("</tr>");
				}
			%>
		</table>
		<table id="rank2_table">
			<tr>
				<td colspan="4"><h2>실시간 추천수 Top5</h2></td>
			</tr>
			<%
				ArrayList<BoardDTO> boardDTOLikes = boardListLikes.getBoardLikesList();
				int cnt2 = 0;
				for (int i = 0; i < 5; i++) {
					cnt2++;
					out.println("<tr>");
					out.println("<td>" + cnt2 + "</td>");
					out.println("<td><a href='free_board_text.jsp?number=" + boardDTOLikes.get(i).getNumber()
							+ "' onclick='views(" + boardDTOLikes.get(i).getNumber() + ")'>"
							+ boardDTOLikes.get(i).getName() + "</td>");
					out.println("<td>" + boardDTOLikes.get(i).getView() + "</td>");
					out.println("<td>" + boardDTOLikes.get(i).getLike() + "</td>");
					out.println("</tr>");
				}
			%>
		</table>
		
		
			
		
		<div id="free_board_write_btn">
			<form action="free_board_write.jsp" onsubmit="return check_login();">
				<input type="submit" value="글쓰기">
			</form>
		</div>

	</div>
	<div id=free_board_footer>
				<section id="pageList">
					<%
					int itemsPerPage = 15; // 페이지당 아이템 수
					int totalItems = boardSize; // 총 아이템 수
					int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); // 전체 페이지 수
					int currentPage = 1; // 현재 페이지, 기본값은 1로 설정
						int pageGroupSize = 10; // 한 그룹당 페이지 수
							int startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize + 1;
							int endPage = Math.min(startPage + pageGroupSize - 1, totalPages);
					%>
					<%
						if (startPage > 1) {
					%>
					<a href="free_board.jsp?page=<%=startPage - 1%>">이전</a>
					<%
						}
					%>
					<!-- 페이지 번호 표시 -->
					<%
						for (int page2 = startPage; page2 <= endPage; page2++) {
					%>
					<a href="free_board.jsp?page=<%=page2%>">[<%=page2%>]
					</a>&nbsp;
					<%
						}
					%>
					<!-- 페이지 그룹 이동 링크 -->
					<%
						if (endPage < totalPages) {
					%>
					<a href="free_board.jsp?page=<%=endPage + 1%>">다음</a>
					<%
						}
					%>
				</section>

				<div id="free_board_search">
					<form action="free_board.jsp" method="get">
						<select name="searchType">
							<option value="title">제목</option>
							<option value="text">내용</option>
							<option value="all">제목+내용</option>
						</select> <input type="search" name="searchQuery"> <input
							type="submit" value="검색">
					</form>
				</div>


			</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

