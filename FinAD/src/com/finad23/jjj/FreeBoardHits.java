package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.BoardDTO;



public class FreeBoardHits {
	
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
		public ArrayList<BoardDTO> getBoardHitsList() {

		Connection connection = con();
		Statement statement = null; 
		ResultSet resultSet = null;

		ArrayList<BoardDTO> arr2 = new ArrayList<BoardDTO>();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM freeboard ORDER BY freeboardViews DESC limit 5;");
			while(resultSet.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setName(resultSet.getString("freeboardname"));
				boardDTO.setNumber(resultSet.getInt("freeboardnumber"));
				boardDTO.setView(resultSet.getInt("freeboardviews"));
				boardDTO.setLike(resultSet.getInt("freeboardLike"));
				arr2.add(boardDTO);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dicon(statement, connection);
		}
		return arr2;
	}
}