<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 완료</title>
        <link rel="stylesheet" href="css/signup_final.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/signup_final.js"></script>
    </head>

    <body>
        <%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");
	String type = (String) session.getAttribute("type");
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
        <div id="main">
            <h1>환영합니다</h1><br>
            <h1>회원가입이 완료 되었습니다</h1><br>
            <input type="button" value="메인으로" onclick="location.href='main.jsp'">
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
