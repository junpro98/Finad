<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.finad23.jjj.Influ_info"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/categori.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/categori01.js"></script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String category = request.getParameter("url");
		List<Influ_info> list = (List<Influ_info>) request.getAttribute("List");
		int creatorNum = list.size();
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
	
	<div class="rank_div">
		<ul class="rank_ul">
			<li class="rank_li01">크리에이터 랭킹</li>
			<%
				out.println("<li class='rank_li02'>총 " + creatorNum + "명의 크리에이터 검색</li>");
			%>

		</ul>
	</div>
	<div class="container">
		<div class="left_filter">
			<form action="category.finad?url=filter" name="form_left" method="post">
				<div>
					<div class="main_shorts">
						<div class="shorts_div">쇼츠 여부</div>
						<select name="shorts" class="shorts" name="shorts">
							<option value="nothing" selected="select">--</option>
							<option value="true">쇼츠 있음</option>
							<option value="false">쇼츠 없음</option>
						</select>
					</div>
					<div class="main_sub">
						<div class="sub_div">구독자 수</div>
						<select name="sub" class="sub" name="sub">
							<option value="nothing01" selected="select">--</option>
							<option value="under10">10만명 이하</option>
							<option value="over10">10만~20만명</option>
							<option value="over20">20만~50만명</option>
							<option value="over50">50만~100만명</option>
							<option value="over100">100만명 이상</option>
						</select>
					</div>
					<div class="main_price">
						<div class="price_div">예상 광고 단가</div>
						<div class="price">
							<select name="price" class="price_select">
								<option value="nothing02" selected="select">--</option>
								<option value="min_price">최소</option>
								<option value="max_price">최대</option>
								<input type="text" name="price_name" class="price_class">만
								원
							</select>
						</div>
					</div>
					<div class="main_avg">
						<div class="avg_div">광고 평균 조회수</div>
						<div class="avg">
							<select name="avg" class="avg_select">
								<option value="nothing03">--</option>
								<option value="min_avg">최소</option>
								<option value="max_avg">최대</option>
								<input type="text" name="avg_name_text" class="avg_class">만
								회
							</select>
						</div>
					</div>
					<div class="main_offer">
						<div class="offer_div">받은 제안 수</div>
						<select name="offer" class="offer">
							<option value="nothing04">--</option>
							<option value="over1">1개 이상</option>
							<option value="over10">10개 이상</option>
							<option value="over50">50개 이상</option>
							<option value="over99">99개 이상</option>
						</select>
					</div>
					<div>
						<div class="submit_div">
							<input type="submit" name="submit" value="적용하기" class="check_sub">
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="rignt_contents">
			<form action="jsp/categori01.jsp" name="form_rignt" method="post">
				<div class="search_view">
					<div>
						<input type="search" class="right-control"
							placeholder="유튜버를 검색하세요">
					</div>
					<div>
						<input type="submit" class="fir_btn" value="관심 유튜버" name="fir_btn">
						<input type="button" class="sec_btn" value="필터 초기화" name="sec_btn">
						<input type="button" class="thr_btn" value="선택한 채널 광고 제안하기"
							name="thr_btn">
					</div>
				</div>
				<div class="cre_list">
					<div class="list_00">
						<div class="list_01_div01">
							<input type="checkbox" name="list_name" id="check" width="20px"
								onclick="all_check()">
							<p></p>
							<p></p>
						</div>
						<div class="list_00_div02">크리에이터</div>
						<div class="list_00_div03">
							<ul>
								<li>구독자 수</li>
								<li>광고영상<br>평균 조회수
								</li>
								<li>예상 CPV</li>
								<li>광고 영상 호감도</li>
								<li>예상 광고 단가</li>
							</ul>
						</div>
					</div>

					<%
						if (list != null) {
							for (int i = 0; i < list.size(); i++) {

								DecimalFormat df = new DecimalFormat("#,###");
								String Subscribers = df.format(list.get(i).getSubscribers());
								String AvgViewers = df.format(list.get(i).getAvgviewers());
					%>
					<div class="list_01">
						<div class="list_01_div01">
							<input type="checkbox" name="list_name01" class="list_check"
								width="20px">
							<p><%=i + 1%></p>
							<p class="star">
								<img src="img/star02.png" alt="" id="star01"
									onclick="img_change(this)">
							</p>
						</div>
						<div class="list_01_div02">
							<a href="creator_page.html" target="_blank"><img
								src="img/<%=list.get(i).getImage()%>" alt="">
								<div>
									<span class="div_img"><%=list.get(i).getNickname()%></span>
								</div> </a>
						</div>
						<div class="list_01_div03">
							<ul>
								<li><%=Subscribers%></li>
								<li><%=AvgViewers%></li>
								<li><%=list.get(i).getAvgviewers() * 0.01%></li>
								<li>광고 영상 호감도</li>
								<li><%=(int) ((list.get(i).getAvgviewers() * 0.001) * 30)%>만원</li>
							</ul>
						</div>
					</div>

					<%
						}
						}
					%>

				</div>
			</form>
		</div>

	</div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>