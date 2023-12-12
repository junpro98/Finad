<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/header_login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/header_login.js"></script>
</head>
<body>
<div class="div_headder">
	<header>
		<div class="top_div">
			<a href="main.jsp"><img src="img/logo2.png" alt="로고"
				id="main_logo"></a>
			<div class="top_button">
				<form action="login.jsp" method="post">
					<input type="submit" name="submit" value="로그인" class="submit">
				</form>
				<form action="signup_agree.jsp" method="post">
					<input type="submit" name="submit" value="회원가입" class="submit">
				</form>
			</div>
		</div>
		<div class="header_search">
			<input type="search" class="form-control" placeholder="search">
		</div>
	</header>
	
</body>

</html>