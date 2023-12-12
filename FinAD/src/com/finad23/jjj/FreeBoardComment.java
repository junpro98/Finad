package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.FreeboardCommentDTO;
import com.finad23.DTO.FreeboardLikeDTO;

public class FreeBoardComment {
	
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
	

	public ArrayList<FreeboardCommentDTO> getBoardList(String clickText) {
		Connection connection = con();
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<FreeboardCommentDTO> arr4 = new ArrayList<FreeboardCommentDTO>();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from project.freeboardComment where freeboardPostId =" + clickText + ";");
			while(resultSet.next()) {
				FreeboardCommentDTO freeboardCommentDTO = new FreeboardCommentDTO();
				freeboardCommentDTO.setUserID(resultSet.getString("freeboardUserID"));
				freeboardCommentDTO.setPostID(resultSet.getInt("freeboardPostID"));
				freeboardCommentDTO.setText(resultSet.getString("freeboardComment"));
				freeboardCommentDTO.setCreatedAt(resultSet.getString("CreatedAt"));
				arr4.add(freeboardCommentDTO);
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