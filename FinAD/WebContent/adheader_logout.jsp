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
	
</body>
</html>