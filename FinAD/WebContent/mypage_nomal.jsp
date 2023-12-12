<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.jjj.Nomal_info"%>
<jsp:useBean id="session1" class="com.finad23.jjj.Mypage"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage_nomal.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/mypage_nomal.js"></script>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
	Nomal_info user = session1.nomal_user(id);
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
				<div class="div_img">
					<img alt="img/user.png" src="img/user.png">
				</div>
				<div class="div_ul">
					<%
							out.println("<ul>");
							out.println("<li>아이디 : " + user.getId() + "</li>");
							out.println("<li>이름 : " + user.getName() + "</li>");
							out.println("<li>이메일 : " + user.getEmail() + "</li>");
							out.println("<li>전화번호 : " + user.getMobilenumber() + "</li>");
							out.println("</ul>");
					%>
				</div>
			</div>
			<hr>
			<div>
			
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>