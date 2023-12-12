<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>일반 유저 회원가입</title>
<link rel="stylesheet" href="css/signup_nomal.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/signup_nomal.js"></script>
</head>

<body>

	<jsp:include page="header_login.jsp"></jsp:include>

	<form action="signup_nomal.jsp" name="form" method="post"
		onsubmit="return checkForm();">
		<div id="signup_input">
			<div id="input_title">일반 회원가입</div>
			<div class="input_info">아이디 :</div>
			<input type="text" id="input_info02" name="id" maxlength="16"
				placeholder="*아이디는 영문 대소문자와 숫자만 입력 가능."><br>
			<p id="result"></p>
			<div class="input_info">비밀번호 :</div>
			<input type="password" class="input_info2" name="pw"
				onblur="checkPW();" maxlength="32"
				placeholder="*비밀번호는 8글자 이상, 32글자 이하만 이용 가능."><br>
			<div class="input_info">비밀번호 확인 :</div>
			<input type="password" class="input_info2" name="pwcheck"
				onblur="checkPW();" maxlength="32" placeholder="*비밀번호 확인"><br>
			<p id="check_pw"></p>
			<div class="input_info">이름 :</div>
			<input type="text" class="input_info2" name="name"
				onblur="checkName();" maxlength="16"><br>
			<p id="check_name"></p>

			<div class="input_info">성별 :</div>
			<div class="input_info2" style="text-align: center;">
				<label for="man" class="radio_box"> <input type="radio"
					id="man" name="gender" value="남성" checked="checked" /> <span
					class="on"></span> 남성
				</label> <label for="woman" class="radio_box"> <input type="radio"
					id="woman" name="gender" value="여성" /> <span class="on"></span> 여성
				</label><br>
			</div>

			<p id="check_sex"></p>
			<div class="input_infoad">주소 :</div>
			<div id="addr_btn">
				<input type="text" id="sample6_postcode" placeholder="우편번호"
					name="post" onblur="checkAddr()" maxlength="50"> <input
					type="button" onclick="addr_btn()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="addr"
					onblur="checkAddr()" maxlength="50"><br> <input
					type="text" id="sample6_detailAddress" placeholder="상세주소"
					name="addr_more" onblur="checkAddr()" maxlength="50"> <input
					type="text" id="sample6_extraAddress" placeholder="참고항목"
					name="reference" onblur="checkAddr()" maxlength="50"><br>
				<p id="check_addr"></p>
			</div>
			<div class="input_info">휴대폰 번호 :</div>
			<div class="input_info2">
				<select class="input_phone" name="phone">
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LG">LG</option>
					<option value="알뜰폰">알뜰폰</option>
				</select> <input type="text" class="input_phone3" name="input_phone"
					onblur="checkPhone();" maxlength="13" placeholder="*(-)를 제외하고 입력"><br>
				<p id="check_phone"></p>
			</div>

			<div class="input_infoem">이메일 :</div>
			<input type="text" class="input_info2" name="email"
				onblur="checkEmail();" maxlength="32"><br>
			<p id="check_email"></p>
			<div class="subnit_div">
				<input type="submit" value="회원가입" id="input_final" name="submit">
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>