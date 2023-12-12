package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.DTO.SellerDTO;

public class SellerConn {
    static SellerConn sellerConn = new SellerConn();
    public static SellerConn instance() {
        return sellerConn;
    }

    SqlSessionFactory sqlsession = SqlConnect.getSqlSession();

    public List<SellerDTO> sqlSelect(String sell) {
        SqlSession sqlSession = sqlsession.openSession();

        List<SellerDTO> list = sqlSession.selectList("itemReviewNumber", sell);
        sqlSession.close();
        return list;
//        sqlSession.select("itemReviewNumber", sell);
        
	}
}
