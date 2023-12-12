<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.finad23.jjj.Influ_info"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	Influ_info article = (Influ_info) request.getAttribute("article");
	String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/creator_page.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/creator_page.js"></script>
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
	<div class="creator_title">
		<div>
			<p class="creator_title_p"><%=article.getNickname() %> 채널분석 리포트</p>
		</div>
		<div class="creator_info">
			<div class="creator_img">
				<a href=<%=article.getYoutuLink() %> target="_blank"><img src="img/<%=article.getImage() %>" alt="" class="creatorimg"></a>
				<ul>
					<li>
						<p>활동명 : <%=article.getNickname() %></p>
					</li>
					<li>
						<p>한국어 | 한국</p>
					</li>
					<li>
						<div class="creator_info_img">
							<a href=<%=article.getYoutuLink() %> target="_blank"><img src="img/youtube.png" alt=""></a> 
							<a href=<%=article.getSnsLink() %> target="_blank"><img src="img/instagram.png" alt=""></a> 
<%-- 							<a href=<%=article.getSnsLink() %> target="_blank"><img src="img/facebook.png" alt=""></a> --%>
						</div>
					</li>
				</ul>
				<div class="button_div">
					<form action="diffCre.finad23" method="post" target="_blank">
						<input type="submit" name="creator_button" class="creator_button" value="인플루언서 비교하기">
						<input type="hidden" name="hidden_nickname" value="<%= article.getNickname()%>">
						<input type="hidden" name="hidden_category" value="<%= category %>">
					</form>
					<form action="jsp/creator_page.jsp" name="button" method="post">
						<input type="button" name="creator_button" class="creator_button" value="<%=article.getNickname() %> 연락하기">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="info_text">
		<p>소개 글</p>
		<div class="text_box"><%=article.getIntroduc() %></div>
	</div>
	<div class="creator_play">
		<p><%=article.getNickname() %> 영상</p>
		<div>
			<iframe width="1300" height="650" src="<%= article.getVideo1() %>?mute=0&autoplay=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		</div>
	</div>
	<div class="top_play">
		<p>가장 높은 조회수 순</p>
		<div class="top_play_div">
			<div>
				<iframe width="410" height="235" src="<%= article.getVideo2() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
			<div>
				<iframe width="410" height="235" src="<%= article.getVideo3() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
			<div>
				<iframe width="410" height="235" src="<%= article.getVideo4() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<div class="avg_look">
		<p class="avg_look_p1">최신 조회수 합</p>
		<p class="avg_look_p2" data-count="<%=article.getAvgviewers() * 10%>">0</p>
		<p class="avg_look_p3">최신 10개 영상의 조회수입니다.</p>
	</div>
	<p class="add_info">추가 정보사항</p>
	<%
	double tenAge = article.getTenAge();
    double tweAge = article.getTweAge();
    double thrAge = article.getThrAge();
    double forAge = article.getForAge();
    double fifAge = article.getFifAge();

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
	
    String gradientStyle = "background: conic-gradient(" +
            "#02f533 " + startTenAge + "% " + endTenAge + "%," +
            "#02b4f5 " + startTweAge + "% " + endTweAge + "%," +
            "#FF3A56 " + startThrAge + "% " + endThrAge + "%," +
            "#ffa600 " + startForAge + "% " + endForAge + "%," +
            "#f5dd02 " + startFifAge + "% " + endFifAge + "%" +
        ");";
    
   double manRatio = article.getMan_ratio();
   double womanRatio = article.getWoman_ratio();
   
   double startManRatio = 0.0;
   double endManRatio = manRatio;
   
   double startWomanRatio = endManRatio;
   double endWomanRatio = 100.0;
   
   String genderStyle = "background: conic-gradient(" + 
  			"#014D81 " + startManRatio + "% " + endManRatio + "%," + 
  			"#FF3A56 " + startWomanRatio + "% " + endWomanRatio + "%" +
  					");";
  					DecimalFormat df = new DecimalFormat("#,###");
					String Subscribers = df.format(article.getSubscribers());
					String AvgViewers = df.format(article.getAvgviewers());
	%>
	
	<div class="chart">
		<div class="donut_box">
			<ul class="donut_ul">
				<li class="donut" style="<%=genderStyle %>"></li>
				<li class="donut_text">구독자 성비<br>
				<span>남<%=article.getMan_ratio() %>%</span><span class="femail_color"> 여<%=article.getWoman_ratio() %>%</span></li>
			</ul>
		</div>
		<div class="donut_box">
			<ul class="donut_ul01">
				<li class="donut01" style="<%=gradientStyle %>"></li>
				<li class="donut_text01">구독자 연령<br>
				<span class="ten">10대</span><span class="twenty"> 20대</span><span class="thirty"> 30대</span><span class="forty"> 40대</span><span class="fifty"> 50대이상</span></li>
			</ul>
		</div>
		<div class="line_box">
			<ul class="line_ul">
				<li class="line">
					<div class="line_canvas">
					<div class="data_count" data-count="<%=article.getAvgviewers()%>">0</div>
					</div>
				</li>
				<li>최근 30일 조회수
				</li>
			</ul>
		</div>
		<div class="line_box">
			<ul class="line_ul">
				<li class="line01">
					<div class="line_canvas01">
					<div class="data_count" data-count="<%=article.getSubscribers()%>">0</div>
					</div>
				</li>
				<li>최근 30일 구독자수
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>