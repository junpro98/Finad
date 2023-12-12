<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.finad23.jjj.Influ_info"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.finad23.DTO.UserLikeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		String type = (String) session.getAttribute("type");
		String category = request.getParameter("url");
// 		List<Influ_info> list = (List<Influ_info>) request.getAttribute("List");
		/* boolean like = (boolean) request.getAttribute("like"); */
		UserLikeDTO userLikeDTO = null;
	%>
	<div class="list_01_div01">
		<button id="star_btn" name="star_btn">
			<img src="img/star01.png" alt="" id="star01">
		</button>
	</div>
</body>
</html>