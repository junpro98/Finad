<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업 유저 회원가입</title>
<link rel="stylesheet" href="css/signup_company.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/signup_company.js"></script>
</head>

<body>

	<jsp:include page="header_login.jsp"></jsp:include>

	<form action="signup_company.jsp" name="form" method="post"
		onsubmit="return checkForm();">
		<div id="signup_input">
			<div id="input_title">기업 회원가입</div>
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
			<div class="input_info">회사명 :</div>
			<input type="text" class="input_info2" name="company_name"
				onblur="checkComName();" maxlength="50"><br>
			<p id="check_comname"></p>
			<div class="input_info">담담자 이름 :</div>
			<input type="text" class="input_info2" name="company_person"
				onblur="checkName();" maxlength="16"><br>
			<p id="check_name"></p>
			<div class="input_info">담당자 전화번호 :</div>
			<input type="text" class="input_info2" name="company_phone"
				onblur="checkPhone();" maxlength="13" placeholder="*(-)를 제외하고 입력"><br>
			<p id="check_phone"></p>
			<div class="input_info">담당자 이메일 :</div>
			<input type="text" class="input_info2" name="company_email"
				onblur="checkEmail();" maxlength="32"><br>
			<p id="check_email"></p>
			<div class="input_info">사업자/법인번호 :</div>
			<input type="text" class="input_info2" name="company_number"
				onblur="checkNumber();" maxlength="40"><br>
			<p id="check_number"></p>
			<div class="subnit_div">
				<input type="submit" value="회원가입" id="input_final" name="submit">
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>