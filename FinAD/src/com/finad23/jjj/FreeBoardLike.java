package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.FreeboardLikeDTO;

public class FreeBoardLike {
	
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
	

	public ArrayList<FreeboardLikeDTO> getBoardList(String id, String clickText) {
		Connection connection = con();
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<FreeboardLikeDTO> arre = new ArrayList<FreeboardLikeDTO>();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select freeboardUserID, freeboardPostID from project.freeboardlike where freeboardUserId = '" + id + "' and freeboardPostId =" + clickText + ";");
			if(resultSet.next()) {
				FreeboardLikeDTO freeboardLikeDTO = new FreeboardLikeDTO();
				freeboardLikeDTO.setUserID(resultSet.getString("freeboardUserID"));
				freeboardLikeDTO.setPostID(resultSet.getInt("freeboardPostID"));
//				freeboardLikeDTO.setIsLiked(resultSet.getString("freeboardIsLiked"));
//				freeboardLikeDTO.setCreatedAt(resultSet.getString("CreatedAt"));

				arre.add(freeboardLikeDTO);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			dicon(statement, connection);
		}
		return arre;
	}
}