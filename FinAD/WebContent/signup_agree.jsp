<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 동의</title>
<link rel="stylesheet" href="css/signup_agree.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/signup_agree.js" type="text/javascript"></script>
</head>
<body>


	<jsp:include page="header_login.jsp"></jsp:include>



	<div id="signup_main">
		<p class="ex_p">약관 동의</p>
		<span class="explain">이용약관, 개인정보 수집 및 이용, 마케팅 · 이벤트정보 수신(선택)에
			모두 동의합니다.</span>
		<div id="div_first" class="check_agree">
			<input type="checkbox" value="" id="check" onclick="all_check()">모두
			동의
		</div>
		<span class="explain">이용약관 동의 (필수)</span>
		<div class="text_agree">여러분을 환영합니다. FINAD 서비스 및 제품(이하 ‘서비스’)을
			이용해 주셔서 감사합니다. 본 약관은 다양한 FINAD 서비스의 이용과 관련하여 FINAD 서비스를 제공하는 FINAD
			주식회사(이하 ‘FINAD’)와 이를 이용하는 FINAD 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
			아울러 여러분의 FINAD 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. FINAD 서비스를
			이용하시거나 FINAD 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
			잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 다양한 FINAD 서비스를 즐겨보세요. FINAD는
			www.FINAD.com을 비롯한 FINAD 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른
			이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고
			있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 FINAD 서비스를 자유롭게
			이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, FINAD 웹고객</div>
		<div class="check_agree">
			<input type="checkbox" id="check_agree1" value="" class="check_01">동의
		</div>
		<span class="explain">만 15세 이상임을 확인합니다 (필수)</span>
		<div class="check_agree">
			<input type="checkbox" id="check_agree2" value="" class="check_01">동의
		</div>
		<div class="text_agree">개인정보보호법에 따라 FINAD에 회원가입 신청하시는 분께 수집하는
			개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한
			사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보
			검색, 뉴스 보기 등 대부분의 FINAD 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페,
			블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, FINAD는 서비스 이용을 위해 필요한
			최소한의 개인정보를 수집합니다. 회원가입 시점에 FINAD가 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원 가입
			시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다.
			실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께
			수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI),
			휴대전화번호)를 추가로 수집합니다. - 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일,
			휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.</div>
		<span class="explain">개인정보 수집 이용 동의 (필수)</span>
		<div class="check_agree">
			<input type="checkbox" id="check_agree3" value="" class="check_01">동의
		</div>
		<p class="ex_p">* 필수 수집항목은 서비스 이용에 필요한 최소한의 정보이며, 동의를 해야만 서비스를 이용할
			수 있습니다.</p>
		<span class="explain">마케팅 · 이벤트정보 수신 동의 (선택)</span>
		<div class="check_agree">
			<input type="checkbox" value="" class="check_01">동의
		</div>
		<div class="text_agree">위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을
			포함하는 FINAD 위치기반 서비스를 이용할 수 있습니다. 제 1 조 (목적) 이 약관은 FINAD 주식회사 (이하
			“회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을
			규정함을 목적으로 합니다. 제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한
			법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의
			이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다. 제 3 조 (서비스 내용 및 요금) ① 회사는
			위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.</div>
		<p class="ex_p">* 선택적 수집항목(마케팅·이벤트정보 수신 동의)은 동의하지 않아도 회원가입은 가능하나,
			다양한 혜택 안내가 제한될 수 있습니다.</p>
		<!-- <p>본인 인증</p>
            <p>아래 인증하기버튼을 클릭해 본인인증을 진행해주세요.</p>
            <p>가입하시는 분 명의로 개설된 휴대폰으로 인증이 가능합니다. (만 15세 미만 가입불가)</p> -->
		<div class="btn_div">
			<input type="button" value="일반 회원" id="btn_agree" onclick="agreeCheck1()"> 
			<input type="button" value="인플루언서 회원" id="btn_agree1" onclick="agreeCheck2()"> 
			<input type="button" value="기업 회원" id="btn_agree2" onclick="agreeCheck3()">
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>