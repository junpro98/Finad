<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.CBoardVolunteerDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/volunteer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/volunteer.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>volunteer.jsp</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");

		//페이지 넘어올때 form에 input type hidden으로 넘겨준 값들
		String clickText = request.getParameter("number");
		String promoMoney = request.getParameter("promoMoney");
		String recruidment = request.getParameter("recruitment"); //모집인원
		String promoType = request.getParameter("promoType");
		String promoDate = request.getParameter("promoDate");
		String promoDate2 = request.getParameter("promoDate2");

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


	<div id="volunteer_container">
		<h1>이런분들이 지원해 주셨어요</h1>
		<table>
			<tr>
				<td>
					<table id="volunteer_list" border="1">
						<tr>
							<th>/</th>
							<!-- 							<th>지원한 게시글</th> -->
							<th>지원자</th>
							<th>평균 시청자</th>
							<th>구독자수</th>
							<th>지원일</th>
						</tr>
						<%
							double count = 0;
							List<CBoardVolunteerDTO> list = (List<CBoardVolunteerDTO>) request.getAttribute("List");
							if (list != null) {
								for (int i = 0; i < list.size(); i++) {
									int volunteerNumber = list.get(i).getVolunteerNumber();
									String volunteer = list.get(i).getVolunteer();
									int companyBoardNumber = list.get(i).getCompanyBoardNumber();
									int volunteerViewer = list.get(i).getVolunteerViewer();
									int volunteerSubscribe = list.get(i).getVolunteerSubscribe();
									int volunteerSex = list.get(i).getVolunteerSex();
									String time = list.get(i).getTime();
									out.println("<tr>");
									out.println("<td><input type='checkbox' name='vol_accept' value=''></td>");
									// 									out.println("<td>" + companyBoardNumber + "</td>");
									out.println("<td>" + volunteer + "</td>");
									out.println("<td>" + volunteerViewer + "</td>");
									out.println("<td>" + volunteerSubscribe + "</td>");
									out.println("<td>" + time + "</td>");
									out.println("</tr>");
									count++;
						%>
						<input type="hidden" id="viewer<%=i%>"
							value="<%=volunteerViewer%>">
						<input type="hidden" id="subscribe<%=i%>"
							value="<%=volunteerSubscribe%>">
						<input type="hidden" id="sex<%=i%>" value="<%=volunteerSex%>">
						<%
							}
							} else {
								out.print("데이터가 부족합니다.");
							}
						%><input type="hidden" id="count" value="<%=count%>">
						<%
							double result = count / 7;
							double roundedNumber = Math.round(result * 100) / 100.0; //소수점 2번째까지만 표기
						%>
					</table>
				</td>
				<td id="second_table">
					<div id="second_table_border">
						<table id=info_box>
							<tr>
								<td class="info_title">총 광고 비용</td>
								<td class="info_title">모집 인원</td>
								<td class="info_title">홍보 기간</td>
								<td class="info_title">광고 유형</td>
							</tr>
							<tr>
								<td class="info_content"><%=promoMoney%> 만원</td>
								<td class="info_content"><%=recruidment%> 명</td>
								<td class="info_content"><%=promoDate%> ~ <%=promoDate2%></td>
								<td class="info_content"><%=promoType%></td>
							</tr>
						</table>
						
						
						
					</div>
				</td>
			</tr>
		</table>

		<table id="info_box2">
			<tr>
				<td class="info_title">경쟁률</td>
				<td class="info_title">성비</td>
				<td class="info_title">평균 시청자</td>
				<td class="info_title">평균 구독자</td>
			</tr>
			<tr>
				<td class="content4">
					<%
						out.println(roundedNumber + " : 1");
					%>
				</td>
				<td class="content2"><canvas class="doughnut_graph" width="300"
						height="300"></canvas></td>
				<td class="content2"><canvas class="bar_graph" width="325"
						height="325"></canvas></td>
				<td class="content2"><canvas class="bar_graph2" width="325"
						height="325"></canvas></td>
			</tr>
		</table>
		<table id="list_btn_container">
			<tr>
				<td>
					<button class="list_btn" onclick="history.back()">게시글</button>
				</td>
				<td>
					<form action="company_board.finad?url=CBoard" method="post">
						<input type="submit" class="list_btn" value="목록">
					</form>
				</td>
			</tr>
		</table>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>