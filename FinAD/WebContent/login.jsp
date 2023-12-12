<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<jsp:include page="header_login.jsp"></jsp:include>

<div class="login-wrapper">
		<h2>로그인</h2>
		<form method="post" action="check_login.jsp" id="login-form">
			<input type="text" name="id" placeholder="아이디"> 
			<input type="password" name="password" placeholder="비밀번호"> 
			<label for="remember-check"><input type="checkbox" id="remember-check" name="cookie">아이디 저장하기</label><br>
			<div id="choice_user" >
				<span id="nomal_btn">
					<input type="radio" name="user_grade" id="normal" value="nomal">
					<label for="normal"></label>
				</span>
				<span id="influencer_btn">
					<input type="radio" name="user_grade" id="influencer" value="influencer">
					<label for="influencer"></label>
				</span>
				<span id="company_btn">
					<input type="radio" name="user_grade" id="company" value="company">
					<label for="company"></label>
				</span>
			</div>
			<input type="submit" value="확인">
		</form>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>