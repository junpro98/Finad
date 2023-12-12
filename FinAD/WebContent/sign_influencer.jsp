<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인플루언서 유저 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/signup_influe.js"></script>
<link rel="stylesheet" href="css/signup_influencer.css">
</head>

<body>
	<jsp:include page="header_login.jsp"></jsp:include>


	<form action="signup_influencer.jsp" name="form" method="post"
		onsubmit="return checkForm();">
		<div id="signup_input">
			<div id="input_title">인플루언서 회원가입</div>
			<div class="input_info">아이디 :</div>
			<input type="text" id="input_info02" name="id" maxlength="16"><br>
			<p id="result"></p>
			<div class="input_info">비밀번호 :</div>
			<input type="password" class="input_info2" name=pw
				onblur="checkPW();" maxlength="32"><br>
			<div class="input_info">비밀번호 확인 :</div>
			<input type="password" class="input_info2" name=pwcheck
				onblur="checkPW();" maxlength="32"><br>
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
			<div class="input_info">활동명 :</div>
			<input type="text" class="input_info2" name="nickname"
				onblur="checkNickName()" maxlength="20"><br>
			<p id="check_nickname"></p>
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
					onblur="checkPhone();" maxlength="13">
				<!-- <input type="button" value="인증하기" class="input_phone"> -->
				<p id="check_phone"></p>
			</div>

			<div class="input_info">이메일 :</div>
			<input type="text" class="input_info2" name="email"
				onblur="checkEmail();" maxlength="32">
			<p id="check_email"></p>
			
			
			<div class="input_infoca">카테고리 선택</div>
			<div>
				<table id="input_info3">
					<tr>
						<td><input type="checkbox" value="beauty"  name="categori">뷰티
							* 패션</td>
						<td><input type="checkbox" value="food" name="categori">먹방</td>
						<td><input type="checkbox" value="BJ" name="categori">BJ
							* 엔터테이너</td>
						<td><input type="checkbox" value="vlog" name="categori">vlog
							* 일상</td>
						<td><input type="checkbox" value="game" name="categori">게임</td>
					</tr>
					<tr>
						<td><input type="checkbox" value="IT" name="categori">IT
							* 전자기기</td>
						<td><input type="checkbox" value="music" name="categori">음악
							* 춤</td>
						<td><input type="checkbox" value="cook" name="categori">요리
							* 베이킹</td>
						<td><input type="checkbox" value="travel" name="categori">여행
							* 아웃도어</td>
						<td><input type="checkbox" value="pet" name="categori">동물
							* 펫</td>
					</tr>
					<tr>
						<td><input type="checkbox" value="sports" name="categori">스포츠
							* 건강</td>
						<td><input type="checkbox" value="movie" name="categori">영화
							* 애니</td>
						<td><input type="checkbox" value="car" name="categori">자동차</td>
						<td><input type="checkbox" value="kid" name="categori">키즈
							* 플레이</td>
						<td><input type="checkbox" value="education" name="categori">교육</td>
					</tr>
					<tr>
						<td><input type="checkbox" value="real statement"
							name="categori">부동산 * 투자</td>
						<td><input type="checkbox" value="politics" name="categori">정치
							* 시사</td>
						<td><input type="checkbox" value="palette" name="categori">그림
							*만들기</td>
						<td><input type="checkbox" value="clover" name="categori">운세
							* 타로</td>
						<td><input type="checkbox" value="another" name="categori">기타</td>
					</tr>
				</table>
			</div>
			<div class="subnit_div">
				<input type="submit" value="회원가입" id="input_final" name="submit">
			</div>
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>