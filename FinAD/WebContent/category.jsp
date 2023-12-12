<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.finad23.jjj.Influ_info"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.finad23.DTO.UserLikeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/categori.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/categori01.js"></script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String category = request.getParameter("url");
		List<Influ_info> list = (List<Influ_info>) request.getAttribute("List");
		UserLikeDTO userLikeDTO = new UserLikeDTO();
		String like = (String) request.getAttribute("like");
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
// 				out.println("<li class='rank_li02'>총 " + creatorNum + "명의 크리에이터 검색</li>");
				/* out.println(category); */
			%>

		</ul>
	</div>
	<div class="container">
		<div class="left_filter">
			<form
				action="category.finad?url=<%=category%>&cat=<%=category%>&filter=true"
				name="form_left" method="post">
				<div>
					<div class="main_shorts">
						<div class="shorts_div">쇼츠 여부</div>
						<select name="shorts" class="shorts">
							<option value="nothing">--</option>
							<option value="true" selected="selected">쇼츠 있음</option>
							<option value="false">쇼츠 없음</option>
						</select>
					</div>
					<div class="main_sub">
						<div class="sub_div">구독자 수</div>
						<select name="sub" class="sub">
							<option value="nothing01">--</option>
							<option value="under10" selected="selected">10만명 이하</option>
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
								<option value="nothing02">--</option>
								<option value="under30" selected="selected">30만원 이하</option>
								<option value="over30">30~100만원</option>
								<option value="over100">100~300만원</option>
								<option value="over300">300만원 이상</option>
							</select>
						</div>
					</div>
					<div class="main_avg">
						<div class="avg_div">광고 평균 조회수</div>
						<div class="avg">
							<select name="avg" class="avg_select">
								<option value="nothing03">--</option>
								<option value="under1000" selected="selected">1000회 이하</option>
								<option value="over1000">1000~5000회</option>
								<option value="over5000">5000~10000회</option>
								<option value="over10000">100000회 이상</option>
							</select>
						</div>
					</div>
					<div class="main_offer">
						<div class="offer_div">받은 제안 수</div>
						<select name="offer" class="offer">
							<option value="nothing04">--</option>
							<option value="over1" selected="selected">1개 이상</option>
							<option value="over10">10개 이상</option>
							<option value="over50">50개 이상</option>
							<option value="over99">99개 이상</option>
						</select>
					</div>
					<div>
						<div class="submit_div">
							<input type="button" name="sub_btn" value="적용하기"
								class="check_sub">
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="rignt_contents">
			<form
				action="catesearch.finad?url=<%=category%>&cat=<%=category%>&catesearch=true"
				name="form_rignt" method="post">
				<div class="search_view">
					<div>
						<input type="search" class="right-control"
							placeholder="크리에이터를 검색하세요" name="cate_search">
					</div>
			</form>
			<div class="btn_class">
				<form action="">
					<div>
						<input type="submit" class="fir_btn" value="관심 유튜버" name="fir_btn">
					</div>
				</form>
				<!-- 					<input type="button" class="sec_btn" value="필터 초기화" name="sec_btn"> -->
				<form action="">
					<div>
						<input type="button" class="thr_btn" value="선택한 채널 광고 제안하기"
							name="thr_btn">
					</div>
				</form>
			</div>
		</div>
		<div class="cre_list">
			<div class="list_00">
				<div class="list_01_div01">
					<input type="checkbox" name="list_name" id="check" onclick="all_check()">
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
					for (Influ_info cate : list) {
						DecimalFormat df = new DecimalFormat("#,###");
						String Subscribers = df.format(cate.getSubscribers());
						String AvgViewers = df.format(cate.getAvgviewers());
						String nickname = cate.getNickname();
			%>
			<div id="list_01_wrapper">
				<div class="list_01 asdf">
					<div class="list_01_div01">
						<input type="checkbox" name="list_name01" class="list_check">
						<p></p>
<%-- 						<%=userLikeDTO.getId()%> --%>
						<%
							 	if (id != null) {
									if (userLikeDTO.getId() == id) {
						%>
						<div class="list_01_div01">
							<p></p>
							<form
								action="creatorLike.finad23?id=<%=id%>&nickname=<%=nickname%>"
								method="post">
								<button id="star_btn" name="star_btn">
									<img src="img/star01.png" alt="" id="star01">
								</button>
								<input type="hidden" class="hidden_name" name="hidden_name" value="<%=nickname%>"> 
								<input type="hidden" class="hidden_id" name="hidden_id" value="<%=id%>">
							</form>
						</div>
						<%
							} else {
						%>
						<div class="list_01_div01">
							<p></p>
							<form
								action="creatorLike.finad23?id=<%=id%>&nickname=<%=nickname%>"
								method="post">
								<button id="star_btn" name="star_btn">
									<img src="img/star02.png" alt="" id="star01">
								</button>
								<input type="hidden" class="hidden_name" name="hidden_name"
									value="<%=nickname%>"> <input type="hidden"
									class="hidden_id" name="hidden_id" value="<%=id%>">
							</form>
						</div>
						<%
							}
									 									}
						%>
					</div>
					<div class="list_01_div02">
						<form action="creator.finad23" method="post" target="_blank">
							<input type="hidden" name="category" value="<%=category%>">
							<input type="hidden" name="nickname" value="<%=nickname%>">
							<button type="submit" class="list_01_img">
								<img src="img/<%=cate.getImage()%>" alt="" id="img_data">
								<div class="div_img">
									<span class="nickname_span"><%=nickname%></span>
								</div>
							</button>
						</form>

					</div>
					<div class="list_01_div03">
						<ul>
							<li><p id="sub_data"><%=Subscribers%></li>
							<%
								if (type == null || type.equals("nomal")) {
							%>
							<li style="filter: blur(5px);"><%=AvgViewers%></li>
							<li style="filter: blur(5px);"><%=cate.getAvgviewers() * 0.01%></li>
							<li style="filter: blur(5px);">data</li>
							<li style="filter: blur(5px);"><%=(int) ((cate.getAvgviewers() * 0.001) * 30)%>만원</li>
							<%
								} else {
							%>
							<li><p id="viwe_data"><%=AvgViewers%></li>
							<li><p id="cpv_data"><%=cate.getAvgviewers() * 0.01%></li>
							<li id="star_li"><img class="star_create"
								src="img/star01.png"><img class="star_create"
								src="img/star01.png"><img class="star_create"
								src="img/star01.png"><img class="star_create"
								src="img/star01.png"><img class="star_create"
								src="img/star02.png"></li>
							<li><p id="price_data"><%=(int) ((cate.getAvgviewers() * 0.001) * 30)%>만원</li>
							<%
								}
							%>
						</ul>
					</div>
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