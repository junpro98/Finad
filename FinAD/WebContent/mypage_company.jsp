<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.jjj.Company_info"%>
<jsp:useBean id="session1" class="com.finad23.jjj.Mypage"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage_company.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/mypage_company.js"></script>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	Company_info user = session1.company(id);
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
	<div class="main">
		<h1>마이페이지</h1>
		<div class="all_info">

			<div class="top_info">
				<div class="user_img">
					<img alt="img/user.png" src="img/samsung.png">
				</div>
				<div class="div_ul">
					<%
						out.println("<ul>");
						out.println("<li>회사명 : " + user.getComname() + "</li>");
						out.println("<li>담당자명 : " + user.getName() + "</li>");
						out.println("<li>담당자 이메일: " + user.getComemail() + "</li>");
						out.println("<li>담당자 전화번호 : " + user.getComnumber() + "</li>");
						out.println("</ul>");
					%>
				</div>
				<div class="div_home">
					<ul>
						<%
							out.println("<li><a href='#' target='_blank'><img alt='' src='img/home.png'></a></li>");
						%>
						<li>기업 홈페이지</li>
					</ul>
				</div>
			</div>
			<hr>
			<h2>소개글</h2>
			
				<div class="text"></div>
			
			<div class="reviousAdvertising">
				<h2>이전 광고 사례</h2>
				<ul>
					<li><iframe width="325" height="190"
							src="https://www.youtube.com/embed/vGJXAJlZZOw?si=p2P8Y0kc76FZ-b8x"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></li>
					<li><iframe width="325" height="190"
							src="https://www.youtube.com/embed/wuUtnXmi7zs?si=Oy2eW6bnbBhjWwyE"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></li>
					<li><iframe width="325" height="190"
							src="https://www.youtube.com/embed/HSREHS-l9Hg?si=ufKAGLLhX-vHDrBu"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></li>
					<li><iframe width="325" height="190"
							src="https://www.youtube.com/embed/Z-wkuJNpFWE?si=ZCjbHkh3zHUCf26R"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></li>
				</ul>
			</div>
			<form action="" method="post">
			<input type="submit" name="submit" value="광고진행사항" class="check_pro">
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>