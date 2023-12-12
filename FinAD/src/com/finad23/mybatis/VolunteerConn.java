package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.CBoardVolunteerDTO;


public class VolunteerConn {

	static VolunteerConn select = new VolunteerConn();
	public static VolunteerConn instance() {
		return select;
	}

	SqlSessionFactory sqlSessionFactory = SqlConnect.getSqlSession();

	public List<CBoardVolunteerDTO> dbSelect(int vnum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		CBoardVolunteerDTO cvdto = new CBoardVolunteerDTO();
		cvdto.setVnum(vnum);
		List<CBoardVolunteerDTO> list = sqlSession.selectList("cBoardVolID", cvdto);
		sqlSession.close();
		return list;

	}

}