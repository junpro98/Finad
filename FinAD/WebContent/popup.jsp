<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.finad23.DTO.CreatorVolun"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-body">
		<table border="1">
			<tr>
				<th>회사명</th>
				<th>제목</th>
				<th>계약</th>
			</tr>
			<%
				ArrayList<CreatorVolun> list = (ArrayList<CreatorVolun>) request.getAttribute("list");
				if (list != null) {
					for (CreatorVolun volun : list) {
						String companyName = volun.getCompanyName();
						String title = volun.getTitle();
						int accept1 = volun.getAccept1();
						out.println("<tr>");
						out.println("<td>" + companyName + "</td>");
						out.println("<td>" + title + "</td>");
						if (accept1 == 0) {
							out.println("<td style='color: #014D81'>계약체결</td>");
						} else if (accept1 == 1) {
							out.println("<td style='color: #FF766B'>계약실패</td>");
						}
						out.println("</tr>");
					}
				} else {
					%>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<%
				}
			%>
		</table>
	</div>
</body>
</html>