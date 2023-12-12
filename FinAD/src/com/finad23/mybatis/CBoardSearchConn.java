package com.finad23.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.CompanyBoardDTO;

public class CBoardSearchConn {

    static CBoardSearchConn select = new CBoardSearchConn();

    public static CBoardSearchConn instance() {
        return select;
    }

    SqlSessionFactory sqlSessionFactory = SqlConnect.getSqlSession();

    public List<CompanyBoardDTO> dbSelect(Map<String, Object> params) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<CompanyBoardDTO> list = sqlSession.selectList("companyBoardSearchID", params);
        sqlSession.close();
        return list;
    }
}
