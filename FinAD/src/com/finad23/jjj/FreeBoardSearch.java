package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.BoardDTO;
import com.finad23.DTO.FreeboardCommentDTO;
import com.finad23.DTO.FreeboardLikeDTO;

public class FreeBoardSearch {
	
	public Connection con() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root", "123456");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public void dicon(Statement statement, Connection connection) {
		try {
			statement.close();
		}catch (Exception ignored) {
			// TODO: handle exception
		}
		try {
			connection.close();
		} catch (Exception ignored) {
			// TODO: handle exception
		}
	}
	

	public ArrayList<BoardDTO> getBoardList(String searchType, String searchQuery) {
		Connection connection = con();
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<BoardDTO> arr4 = new ArrayList<BoardDTO>();
		String searchType2 = searchType;
		String searchQuery2 = searchQuery;
		
		try {
			statement = connection.createStatement();
			if (searchType2.equals("title") && !searchQuery2.trim().isEmpty()) {
				String formattedQuery = searchQuery2.trim();
				resultSet = statement.executeQuery("SELECT * FROM project.freeboard WHERE freeboardName LIKE '%" + formattedQuery + "%'");
			}
			if (searchType2.equals("text") && !searchQuery2.trim().isEmpty()) {
				String formattedQuery = searchQuery2.trim();
				resultSet = statement.executeQuery("SELECT * FROM project.freeboard WHERE freeboardText LIKE '%" +formattedQuery + "%'");
			}
			if (searchType2.equals("all") && !searchQuery2.trim().isEmpty()) {
			    String formattedQuery = searchQuery2.trim();
			    resultSet = statement.executeQuery("SELECT * FROM project.freeboard WHERE freeboardName LIKE '%" + formattedQuery + "%' OR freeboardText LIKE '%" + formattedQuery + "%'");
			}
			while(resultSet.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setNumber(resultSet.getInt("freeboardnumber"));
				boardDTO.setWriter(resultSet.getString("freeboardwriter"));
				boardDTO.setName(resultSet.getString("freeboardname"));
				boardDTO.setText(resultSet.getString("freeboardtext"));
				boardDTO.setDate(resultSet.getString("freeboarddate"));
				boardDTO.setView(resultSet.getInt("freeboardviews"));
				boardDTO.setLike(resultSet.getInt("freeboardLike"));
				arr4.add(boardDTO);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dicon(statement, connection);
		}
		return arr4;
	}
}