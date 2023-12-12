<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.finad23.DTO.AdstoreDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adstore_item.jsp</title>
<link rel="stylesheet" href="css/adstore.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/adstore.js" type="text/javascript"></script>
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
	<jsp:useBean id="adstore" class="com.finad23.jjj.Adstore" scope="page" />
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>