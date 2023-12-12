<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.finad23.jjj.Influ_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/compare.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="js/compare.js"></script>
</head>
<body>
	<%
		ArrayList<Influ_info> info = (ArrayList<Influ_info>) request.getAttribute("info");
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String category = request.getParameter("hidden_category");
		String nickname = request.getParameter("hidden_nickname");
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
	<div class="contents">
		<section>
			<h1>인플루언서 비교하기</h1>
		</section>

		<div class="container">
			<%
				if (info != null) {
					// 리스트에서 일치하지 않는 닉네임을 담을 변수
					ArrayList<String> noMatNick = new ArrayList<String>();

					for (Influ_info cate : info) {
						DecimalFormat df = new DecimalFormat("#,###");
						String Subscribers = df.format(cate.getSubscribers());
						String AvgViewers = df.format(cate.getAvgviewers());
						String AvgSub = df.format(cate.getThravgSub());
						if ("true".equals(cate.getShorts())) {
							cate.setShorts("O");
						} else {
							cate.setShorts("X");
						}

						// 닉네임이 일치하지 않으면 리스트에 추가
						if (nickname != null && !nickname.isEmpty() && !nickname.equals(cate.getNickname())) {
							noMatNick.add(cate.getNickname());
						}

						if (nickname != null && !nickname.isEmpty() && nickname.equals(cate.getNickname())) {
			%>
			<section id="fir_sec">
				<p></p>
				<div>
					<img alt="" src="img/<%=cate.getImage()%>">
				</div>
				<div>
					닉네임 : <span class="leftNick"><%=cate.getNickname()%></span>
				</div>
				<div>
					구독자 : <span class="leftSub"><%=Subscribers%></span>
				</div>
				<div>
					평균조회수 : <span class="leftView"><%=AvgViewers%></span>
				</div>
				<div>
					30일구독자수 : <span class="left3Sub"><%=AvgSub%></span>
				</div>
				<div>
					쇼츠유무 : <span><%=cate.getShorts()%></span>
				</div>
			</section>
			<%
				}
					}
			%>
			<section id="cen_sec">
				<div id="columnchart_material" style="height: 500px;"></div>
			</section>
			<%-- nickname이 일치하지 않는 경우에만 하나의 select에 option으로 추가 --%>
			<section id="sec_sec">
				<form action="">
					<select name="nonMatNickname" id="nonMat">
						<option value="">--</option>
						<%
							for (String nonMatNick : noMatNick) {
						%>
						<option value="<%=nonMatNick%>,<%=category%>"
							id="nonMat_option_<%=nonMatNick%>"><%=nonMatNick%></option>
						<%
							}
						%>
					</select>
					<div class="sec_ajax">
						<div>
							<span class="com_img"></span>
						</div>
						<div>
							닉네임 : <span class="com_nick"></span>
						</div>
						<div>
							구독자 : <span class="com_sub"></span>
						</div>
						<div>
							평균조회수 : <span class="com_view"></span>
						</div>
						<div>
							30일구독자수 : <span class="com_thr"></span>
						</div>
						<div>
							쇼츠유무 : <span class="com_shorts"></span>
						</div>
					</div>
				</form>
			</section>

		</div>
	</div>
	<%
		} else {
	%>
	ㅎㅇ
	<%
		}
	%>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
