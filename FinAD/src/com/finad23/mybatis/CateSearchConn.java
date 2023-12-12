package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.CateSearchDTO;

public class CateSearchConn {
	static CateSearchConn conn = new CateSearchConn();
	
	public static CateSearchConn instance() {
		return conn;
	}
	SqlSessionFactory sqlsession = SqlConnect.getSqlSession();
	
	public List<CateSearchDTO> search(CateSearchDTO searchDTO) {
		SqlSession session = sqlsession.openSession();
		
		List<CateSearchDTO> list = session.selectList("cateSearchId", searchDTO);
		System.out.println(searchDTO);
		System.out.println("Conn검색어 입력 " + searchDTO.getNickname());
		session.close();
		return list;
	}
	
}
