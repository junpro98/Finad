<%@page import="java.text.DecimalFormat"%>
<%@page import="com.finad23.jjj.Influ_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/compare.js"></script>
</head>
<body>
	<%
		Influ_info info = (Influ_info) request.getAttribute("influ_info");
		DecimalFormat df = new DecimalFormat("#,###");
		String sub = df.format(info.getSubscribers());
		String avgv = df.format(info.getAvgviewers());
		String avgs = df.format(info.getThravgSub());
		if ("true".equals(info.getShorts())) {
			info.setShorts("O");
		} else {
			info.setShorts("X");
		}
	
	%>

	<div class="sec_ajax">
		<div>
			<span class="ajax_img"><img alt="" src="img/<%=info.getImage()%>"></span>
		</div>
		<div>
			닉네임 : <span class="ajax_nick"><%= info.getNickname() %></span>
		</div>
		<div>
			구독자 : <span class="ajax_avgSub"><%= sub %></span>
		</div>
		<div>
			평균조회수 : <span class="ajax_avgView"><%= avgv %></span>
		</div>
		<div>
			30일구독자수 : <span class="ajax_thrSub"><%= avgs %></span>
		</div>
		<div>
			쇼츠유무 : <span class="ajax_shorts"><%= info.getShorts() %></span>
		</div>
	</div>
</body>
</html>