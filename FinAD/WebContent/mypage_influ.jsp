<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.finad23.jjj.Influ_info"%>
<%@ page import="java.text.DecimalFormat"%>

<%@ page import="com.finad23.jjj.Mypage_influ"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.finad23.DTO.CreatorVolun" %>
<%@ page import="java.util.HashMap"%>
<jsp:useBean id="session1" class="com.finad23.jjj.Mypage"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage_influ.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="js/mypage_influ.js"></script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		if (id == null && password == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
	<jsp:include page="header_logout.jsp"></jsp:include>
	<%
		}
		Influ_info user = session1.influ(id);
		Mypage_influ user1 = session1.influ_mypage(id);
	%>

	<div class="main">
		<h1>마이페이지</h1>
		<div class="all_info">

			<div class="top_info">
				<div class="user_img">
					<%
						out.println("<img src='img/" + user1.getImage() + "'>");
					%>
					<!-- <img alt="img/user.png" src="img/user.png"> -->
				</div>
				<div class="div_ul">
					<button id="showInfo">정보 확인하기</button>
					<ul class='info_ul'>
						<%
							out.println("<li>닉네임 : " + user.getNickname() + "</li>");
							out.println("<li>이름 : " + user.getName() + "</li>");
							out.println("<li>이메일 : " + user.getEmail() + "</li>");
							out.println("<li>전화번호 : " + user.getMobilenumber() + "</li>");
						%>
					</ul>

				</div>
				<div class="div_sns">
					<ul>
						<%
							out.println("<li><a href='" + user1.getYoutuLink()
									+ "' target='_blank'><img alt='' src='img/youtube.png'></a></li>");
							out.println("<li><a href='" + user1.getLiveBcLink()
									+ "' target='_blank'><img alt='' src='img/twitch.png'></a></li>");
							out.println("<li><a href='" + user1.getSnsLink()
									+ "' target='_blank'><img alt='' src='img/instagram.png'></a></li>");
						%>
					</ul>
				</div>
			</div>
			<hr>
			<div class="div_data">
				<div>
					<ul>
						<li>구독자 수</li>
						<li>평균 시청자 수</li>
					</ul>
				</div>
				<div>
					<ul>
						<%
							DecimalFormat df = new DecimalFormat("#,###");
							String Subscribers = df.format(user1.getSubscribers());
							String AvgViewers = df.format(user1.getAvgviewers());
							out.println("<li>" + Subscribers + "</li>");
							out.println("<li>" + AvgViewers + "</li>");
						%>
					</ul>
				</div>
			</div>
			<div class="div_data2">
				<div>
					<ul>
						<%
							double tenAge = user1.getTenAge();
							double tweAge = user1.getTweAge();
							double thrAge = user1.getThrAge();
							double forAge = user1.getForAge();
							double fifAge = user1.getFifAge();

							double startTenAge = 0.0;
							double endTenAge = tenAge;

							double startTweAge = endTenAge;
							double endTweAge = startTweAge + tweAge;

							double startThrAge = endTweAge;
							double endThrAge = startThrAge + thrAge;

							double startForAge = endThrAge;
							double endForAge = startForAge + forAge;

							double startFifAge = endForAge;
							double endFifAge = 100.0; // 최대 100%까지

							String gradientStyle = "background: conic-gradient(" + "#02f533 " + startTenAge + "% " + endTenAge + "%,"
									+ "#02b4f5 " + startTweAge + "% " + endTweAge + "%," + "#FF3A56 " + startThrAge + "% " + endThrAge
									+ "%," + "#ffa600 " + startForAge + "% " + endForAge + "%," + "#f5dd02 " + startFifAge + "% "
									+ endFifAge + "%" + ");";

							double manRatio = user1.getMan_ratio();
							double womanRatio = user1.getWoman_ratio();

							double startManRatio = 0.0;
							double endManRatio = manRatio;

							double startWomanRatio = endManRatio;
							double endWomanRatio = 100.0;

							String genderStyle = "background: conic-gradient(" + "#014D81 " + startManRatio + "% " + endManRatio + "%,"
									+ "#FF3A56 " + startWomanRatio + "% " + endWomanRatio + "%" + ");";
							out.println(
									"<li><p class='count-num' data-count='" + user1.getThravgSub() + "'>0</p><br>최근 30일 구독자 수</li>");
							out.println(
									"<li><p class='count-num' data-count='" + user1.getThravgViewer() + "'>0</p><br>최근 30일 시청자 수</li>");
							out.println(
									"<li><p class='count-num' data-count='" + user1.getThravgHit() + "'>0</p><br>최근 30일 평균 조회수</li>");
							out.println("<li><p class='gender_type' style='" + genderStyle
									+ "'></p><br>구독자 성비<div class='man_woman'><div class='man'>남 : " + manRatio
									+ "</div><div class='woman'>여 : " + womanRatio + "</div></div></li>");
							out.println("<li><p class='sub_age' style='" + gradientStyle
									+ "'></p><br>구독자 연령대<br><div class='avg_age'><div class='ten'>10대" + tenAge
									+ "</div><div class='twe'>20대" + tweAge + "</div><div class='thr'>30대" + thrAge
									+ "</div><div class='fort'>40대" + forAge + "</div><div class='fift'>50대" + fifAge
									+ "</div></div></li>");
						%>

					</ul>
				</div>
			</div>
			<hr>
			<h2>카테고리</h2>
			<div class="div_category">
				<ul>
					<%
						String category = user.getCategory();
						String[] categories = category.split(",");
						HashMap<String, String> categoryImages = new HashMap<>();
						HashMap<String, String> categoryName = new HashMap<>();
						categoryImages.put("beauty", "img/beauty.png");
						categoryName.put("beauty", "뷰티 * 패션");
						categoryImages.put("food", "img/food.png");
						categoryName.put("food", "먹방");
						categoryImages.put("BJ", "img/BJ.png");
						categoryName.put("BJ", "BJ *엔터테이너");
						categoryImages.put("vlog", "img/vLog.png");
						categoryName.put("vlog", "vLog");
						categoryImages.put("game", "img/game.png");
						categoryName.put("game", "게임");
						categoryImages.put("IT", "img/IT.png");
						categoryName.put("IT", "IT *전자기기");
						categoryImages.put("music", "img/music.png");
						categoryName.put("music", "음악 * 츰");
						categoryImages.put("cook", "img/cook.png");
						categoryName.put("cook", "요리* 베이킹");
						categoryImages.put("travel", "img/travel.png");
						categoryName.put("travel", "여행* 아웃도어");
						categoryImages.put("pet", "img/pet.png");
						categoryName.put("pet", "동물 * 펫");
						categoryImages.put("sports", "img/sports.png");
						categoryName.put("sports", "스포츠 * 건강");
						categoryImages.put("movie", "img/movie.png");
						categoryName.put("movie", "영화 * 애니");
						categoryImages.put("car", "img/car.png");
						categoryName.put("car", "자동차");
						categoryImages.put("kid", "img/kid.png");
						categoryName.put("kid", "키즈 * 플레이");
						categoryImages.put("education", "img/education.png");
						categoryName.put("education", "교육");
						categoryImages.put("real statement", "img/real estate.png");
						categoryName.put("real statement", "부동산 * 투자");
						categoryImages.put("politics", "img/Politics.png");
						categoryName.put("politics", "정치 * 시사");
						categoryImages.put("palette", "img/palette.png");
						categoryName.put("palette", "그림 * 만들기");
						categoryImages.put("clover", "img/clover.png");
						categoryName.put("clover", "운세 * 타로");
						categoryImages.put("another", "img/another.png");
						categoryName.put("another", "기타");
						// 각 카테고리에 대한 이미지 출력
						if (categories == null || categories.length == 0) {
							out.println("<li>선택하신 카테고리가 없습니다.</li>");
						} else {
							for (String cat : categories) {
								out.print("<div class='cate_div'>");
								out.print("<li>");
								out.print("<img src='" + categoryImages.get(cat) + "'>");
								out.print("<p>" + categoryName.get(cat) + "</p>");
								out.print("</li>");
								out.print("</div>");
							}
						}
					%>
				</ul>
			</div>
			<h2>소개글</h2>
			<div class="text">
				<%
					out.println(user1.getIntroduc());
				%>
			</div>
			<form action="volunCompany.finad23" method="post">
				<input type="hidden" name="hidden" value="<%=id%>" id="hidden_id">
				<input type="button" name="popUp_btn" value="광고진행사항"
					class="check_pro" onclick="showPopup();">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>