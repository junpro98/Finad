package com.finad23.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.finad23.jjj.Influ_info;


public class CategoryConn { //DB 연결하는 파일
	static CategoryConn categoryConn = new CategoryConn();
	public static CategoryConn instance() {
		return categoryConn;
	} // 싱글턴 패턴입니다요
	
	SqlSessionFactory sqlsession = SqlConnect.getSqlSession();
	
	public List<Influ_info> sqlSelect(Influ_info inf) {
		SqlSession session = sqlsession.openSession(); // openSession으로 session을 연다
		
		List<Influ_info> list = session.selectList("categoryId", inf);
		session.close(); // session을 열였으니 닫아준다.
		return list;
	}
}
