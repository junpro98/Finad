package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.CompanyBoardDTO;



public class CBoardConn {
	
	static CBoardConn select = new CBoardConn();
	public static CBoardConn instance() {
		return select;
	}
	
	SqlSessionFactory sqlSessionFactory = SqlConnect.getSqlSession();
	
	public List<CompanyBoardDTO> dbSelect() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CompanyBoardDTO> list = sqlSession.selectList("companyBoardID");
		sqlSession.close();
		return list;
				
	}

}
