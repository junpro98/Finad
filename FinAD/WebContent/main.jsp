<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" type="text/css" />
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String category = request.getParameter("url");
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
	<%-- 	<%= id %>
	<%= password %>
	<%= type %> --%>
	<div class="center">
		<div class="center_container">
			<div class="center_container_div">
				<div class="center_container_p">
					<p class="p1"></p>
					<p class="p2"></p>
				</div>
				<div class="center_container_search">
					<div class="center_container_search_form">
						<form action="search.finad23" name="form_rignt" method="post">
							<div class="icon_button">
								<input id="center_container_button" type="search" placeholder="찾으시는 유튜버를 검색해주세요" autocomplete="off" name="main_search"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="creator_type">
		<p class="creator_p">크리에이터 분류</p>
		<div class="creator_type_div">
			<ul class="creator_type_ul">
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=beauty"><img src="img/beauty.png" alt="뷰티,패션">
						<p>뷰티,패션</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=food"><img src="img/food.png" alt="먹방">
						<p>먹방</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=BJ"><img src="img/BJ.png" alt="BJ,엔터테이너">
						<p>BJ,엔터테이너</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=vlog"><img src="img/vLog.png" alt="VLOG,일상">
						<p>VLOG,일상</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=game"><img src="img/game.png" alt="게임">
						<p>게임</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=IT"><img src="img/IT.png" alt="IT,전자기기">
						<p>IT,전자기기</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=music"><img src="img/music.png" alt="음악,춤">
						<p>음악,춤</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=cook"><img src="img/cook.png" alt="요리,베이킹">
						<p>요리,베이킹</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=travel"><img src="img/travel.png" alt="여행,아웃도어">
						<p>여행,아웃도어</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=pet"><img src="img/pet.png" alt="동물,펫">
						<p>동물,펫</p> </a></li>
			</ul>
			<ul class="creator_type_ul">
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=sports"><img src="img/sports.png" alt="스포츠,건강">
						<p>스포츠,건강</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=movie"><img src="img/movie.png" alt="영화,애니">
						<p>영화,애니</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=car"><img src="img/car.png" alt="자동차">
						<p>자동차</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=kid"><img src="img/kid.png" alt="키즈,플레이">
						<p>키즈,플레이</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=education"><img src="img/education.png" alt="교육">
						<p>교육</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=realestate"><img src="img/real estate.png" alt="부동산,투자">
						<p>부동산,투자</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=politics"><img src="img/Politics.png" alt="정치,시사">
						<p>정치,시사</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=palette"><img src="img/palette.png" alt="그림,만들기">
						<p>그림,만들기</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=clover"><img src="img/clover.png" alt="운세,타로">
						<p>운세,타로</p> </a></li>
				<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="category.finad?url=another"><img src="img/another.png" alt="기타">
						<p>기타</p> </a></li>
			</ul>
		</div>
	</div>
	<div class="advertising_type">
		<p class="advertising_type_p">광고유형</p>
		<ul class="advertising_ul">
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="https://www.naver.com" target="_blank"><img src="img/live.png" alt="생방송">
					<p class="li_p">생방송</p> </a></li>
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="#" target="_blank"><img src="img/youtube_review.png" alt="유튜브 리뷰">
					<p class="li_p">유튜브 리뷰</p> </a></li>
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="#" target="_blank"><img src="img/youtube_contents.png" alt="유튜브 콘텐츠">
					<p class="li_p">유튜브 콘텐츠</p> </a></li>
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="#" target="_blank"><img src="img/promotional model.png" alt="홍보모델">
					<p class="li_p">홍보모델</p> </a></li>
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="#" target="_blank"><img src="img/promotional banner.png" alt="홍보베너">
					<p class="li_p">홍보베너</p> </a></li>
			<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a href="#" target="_blank"><img src="img/CF.png" alt="CF">
					<p class="li_p">CF</p> </a></li>
		</ul>
	</div>

	<p class="praticipationg_p">참여중인 기업</p>
	<div class="pra_div">
		<div class="pra_div_div">
			<ul class="pra_ul">
				<li class="pra_li">
					<div class="participating_companies">
						<div class="participating_companies_div">
							<ul>
								<li><a href="" target="_blank"><img src="img/amazon.png" alt="기업1" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/samsung.png" alt="기업2" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/lg.png" alt="기업3" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/puma.png" alt="기업4" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/nike.png" alt="기업5" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/prada.png" alt="기업6" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/pepsi.png" alt="기업7" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/cocacola.png" alt="기업8" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/aliexpress.png" alt="기업9" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/sony.png" alt="기업10" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/kia.png" alt="기업11" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/hyundai.png" alt="기업12" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="pra_li">
					<div class="participating_companies">
						<div class="participating_companies_div">
							<ul>
								<li><a href="" target="_blank"><img src="img/amazon.png" alt="기업1" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/samsung.png" alt="기업2" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/lg.png" alt="기업3" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/puma.png" alt="기업4" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/nike.png" alt="기업5" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/prada.png" alt="기업6" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/pepsi.png" alt="기업7" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/cocacola.png" alt="기업8" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/aliexpress.png" alt="기업9" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/sony.png" alt="기업10" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/kia.png" alt="기업11" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/hyundai.png" alt="기업12" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="pra_li">
					<div class="participating_companies">
						<div class="participating_companies_div">
							<ul>
								<li><a href="" target="_blank"><img src="img/amazon.png" alt="기업1" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/samsung.png" alt="기업2" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/lg.png" alt="기업3" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/puma.png" alt="기업4" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/nike.png" alt="기업5" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/prada.png" alt="기업6" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/pepsi.png" alt="기업7" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/cocacola.png" alt="기업8" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
							<ul>
								<li><a href="" target="_blank"><img src="img/aliexpress.png" alt="기업9" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/sony.png" alt="기업10" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/kia.png" alt="기업11" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
								<li><a href="" target="_blank"><img src="img/hyundai.png" alt="기업12" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"></a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="img_info_main">
		<div class="img_info">
			<img src="img/main_adstore.gif" alt="">
		</div>
		<div class="img_info02">
			<a href="adstore.html" target="_blank"><img src="img/main_baro.png" alt=""></a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>