package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.CompanyUserDTO;
import com.finad23.DTO.CompanyUserMypageDTO;


public class CUserConn {
	
	static CUserConn select = new CUserConn();
	public static CUserConn instance() {
		return select;
	}
	
	SqlSessionFactory sqlSessionFactory = SqlConnect.getSqlSession();
	
	public List<CompanyUserMypageDTO> dbSelect(String cid) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		CompanyUserMypageDTO cUserMypageDTO = new CompanyUserMypageDTO();
		cUserMypageDTO.setCid(cid);
		List<CompanyUserMypageDTO> list = sqlSession.selectList("companyUserID", cUserMypageDTO);
		sqlSession.close();
		return list;
				
	}

}
