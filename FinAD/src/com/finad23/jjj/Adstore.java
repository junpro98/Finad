package com.finad23.jjj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.finad23.DTO.AdstoreDTO;


public class Adstore {
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
	
	
	
	
	public ArrayList<AdstoreDTO> getAdstoreList() {

		ArrayList<AdstoreDTO> arr = new ArrayList<AdstoreDTO>();
		
		try {
			con();
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from project.adstore;");
			while(resultSet.next()) {
				AdstoreDTO adstoreDTO = new AdstoreDTO();
				adstoreDTO.setItemNumber(resultSet.getInt("itemNumber"));
				adstoreDTO.setItemSeller(resultSet.getString("itemSeller"));
				adstoreDTO.setItemName(resultSet.getString("itemName"));
				adstoreDTO.setItemPrice(resultSet.getInt("itemPrice"));
				adstoreDTO.setItemInfo(resultSet.getString("itemInfo"));
				adstoreDTO.setItemImage(resultSet.getString("itemImage"));
				adstoreDTO.setItemDate(resultSet.getString("itemDate"));
				adstoreDTO.setItemDetail1(resultSet.getString("itemDetail1"));
				adstoreDTO.setItemDetail2(resultSet.getString("itemDetail2"));
				adstoreDTO.setItemDetail3(resultSet.getString("itemDetail3"));
				arr.add(adstoreDTO);
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