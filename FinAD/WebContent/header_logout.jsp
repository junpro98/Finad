<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	// 인증된 세션이 없으면 페이지 못보게 할거임
	// getAttribute하면 오브젝트 타입으로 넘어오기때문에 우리가 사용하기 편하게 하기 위해 앞에 강제로
	// 형변환 해준거임
	
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	/*
	if (id == null && password == null) {
		response.sendRedirect("login.jsp");
	}
 	request.getParameter("logout");
	if (request.getParameter("logout") != null) {
		session.removeAttribute("id");
		session.removeAttribute("password");
		response.sendRedirect("main.jsp");
	}
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/header_logout.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/header_logout.js"></script>
</head>
<body>
	<div class="div_headder">
		<header>
			<div class="top_div">
				<a href="main.jsp"><img src="img/logo2.png" alt="로고"
					id="main_logo"></a>
				<div class="top_button">
					<form action="logout.jsp" id="logoutForm" method="post">
						<input type="submit" value="로그아웃" name="logout" class="submit">
					</form>
					<form action="into_mypage.jsp" method="post">
						<input type="submit" value="마이페이지" name="mypage" class="submit">
					</form>
				</div>
			</div>
			<div class="header_search">
				<input type="search" class="form-control" placeholder="search">
			</div>
		</header>
		<div class="nav_div">
			<nav>
				<p class="gnbbox"></p>
			<div class="category">
				<div class="category_text">카테고리</div>
				<ul class="nav_ul">
						<li class="nav_li01"><a href="company_board.finad?url=CBoard">광고게시판</a></li>
						<li class="nav_li02"><a href="">크리에이터 게시판</a></li>
						<li class="nav_li03"><a href="free_board.jsp">자유게시판</a></li>
						<li class="nav_li04"><a href="">광고현황</a></li>
						<li class="nav_li05"><a href="adstore.jsp">ADStore</a></li>
					</ul>
				<div class="category_div">
					<div class="gnb_div">
						<ul class="gnb">
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
							<a href="category.finad?url=beauty">
									<div>
										<img src="img/beauty_img.png" alt="">
										<div class="li_text">뷰티 * 패션</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=food">
									<div>
										<img src="img/food_img.png" alt="">
										<div class="li_text">먹방</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=BJ" >
									<div>
										<img src="img/BJ_img.png" alt="">
										<div class="li_text">BJ * 엔터테이너</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=vlog" >
									<div>
										<img src="img/vlog_img.png" alt="">
										<div class="li_text">vlog * 일상</div>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="gnb_div">
						<ul class="gnb">
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=game" >
									<div>
										<img src="img/game_img.png" alt="">
										<div class="li_text">게임</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=IT">
									<div>
										<img src="img/IT_img.png" alt="">
										<div class="li_text">IT * 전자기기</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=music">
									<div>
										<img src="img/music_img.png" alt="">
										<div class="li_text">음악 * 춤</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=cook">
									<div>
										<img src="img/cook_img.png" alt="">
										<div class="li_text">요리 * 베이킹</div>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="gnb_div">
						<ul class="gnb">
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=travel">
									<div>
										<img src="img/travel_img.png" alt="">
										<div class="li_text">여행 * 아웃도어</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=pet">
									<div>
										<img src="img/pet_img.png" alt="">
										<div class="li_text">동물 * 펫</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=sports">
									<div>
										<img src="img/sports_img.png" alt="">
										<div class="li_text">스포츠 * 건강</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=movie">
									<div>
										<img src="img/movie_img.png" alt="">
										<div class="li_text">영화 * 애니</div>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="gnb_div">
						<ul class="gnb">
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=car">
									<div>
										<img src="img/car_img.png" alt="">
										<div class="li_text">자동차</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=kid">
									<div>
										<img src="img/kid_img.png" alt="">
										<div class="li_text">키즈 * 플레이</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=education">
									<div>
										<img src="img/education_img.png" alt="">
										<div class="li_text">교육</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=realestate">
									<div>
										<img src="img/real estate_img.png" alt="">
										<div class="li_text">부동산 * 투자</div>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="gnb_div">
						<ul class="gnb">
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=politics">
									<div>
										<img src="img/Politics_img.png" alt="">
										<div class="li_text">정치 * 시사</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=palette">
									<div>
										<img src="img/palette_img.png" alt="">
										<div class="li_text">그림 *만들기</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=clover">
									<div>
										<img src="img/clover_img.png" alt="">
										<div class="li_text">운세 * 타로</div>
									</div>
							</a></li>
							<li onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"><a
								href="category.finad?url=another">
									<div>
										<img src="img/another_img.png" alt="">
										<div class="li_text">기타</div>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			</nav>
		</div>
	</div>
</body>
</html>