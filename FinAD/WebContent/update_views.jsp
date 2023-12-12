<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!-- update_views.jsp -->
<%
    int boardId = Integer.parseInt(request.getParameter("boardId")); // 게시물 ID를 받아옵니다.
	String result = null;
    Connection connection = null;
    Statement statement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "123456");
        if (connection == null) {
            throw new Exception("데이터베이스 연결 안됨");
        }
        statement = connection.createStatement();

        // 게시물의 조회수를 1 증가시키는 SQL문 실행
        String updateQuery = "UPDATE project.freeboard SET freeboardviews = freeboardviews + 1 WHERE freeboardNumber = " + boardId;
        int rowsAffected = statement.executeUpdate(updateQuery);

        if (rowsAffected > 0) {
            // 조회수 업데이트 성공
           	result = "success";
        } else {
            // 조회수 업데이트 실패
            result = "fail";
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("fail"); // 오류 발생 시 실패 메시지 출력
    } finally {
        try {
            statement.close();
        } catch (Exception ignored) {
        }

        try {
            connection.close();
        } catch (Exception ignored) {
        }
    }
%>
