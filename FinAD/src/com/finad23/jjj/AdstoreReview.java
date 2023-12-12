package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.AdstoreReviewDTO;


public class AdstoreReview {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	
	public Connection con() {
		
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
	
	
	public void close() {
		try {
			resultSet.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	public ArrayList<AdstoreReviewDTO> getAdreviewList() {

		ArrayList<AdstoreReviewDTO> arr = new ArrayList<AdstoreReviewDTO>();
		
		try {
			con();
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from project.adstorereview;");
			while(resultSet.next()) {
				AdstoreReviewDTO adstorereviewDTO = new AdstoreReviewDTO();
				adstorereviewDTO.setItemReviewNumber(resultSet.getInt("itemReviewNumber"));
				adstorereviewDTO.setNomalUserId(resultSet.getString("nomalUserId"));
				adstorereviewDTO.setItemReviewText(resultSet.getString("itemReviewText"));
				adstorereviewDTO.setAttachedFile(resultSet.getString("attachedFile"));
				adstorereviewDTO.setReviewTitle(resultSet.getString("reviewTitle"));
				
				arr.add(adstorereviewDTO);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return arr;
	}
}

