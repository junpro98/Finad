package com.finad23.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 싱글 턴 패턴 - 클래스를 작업할때 클래스가 필요하면 객체가 계속 만들어져야 하는데 변수나 이런 아이들은 소멸이 없기때문에 하나만 만들어서 재사용 할려고 하기 때문에 이거 사용.
public class SqlControl {
//	SqlSessionFactory는 mybatis에 들어가 있는 클래스고, sqlSession는 객체 라고 생각하면 된다.
	private static SqlSessionFactory sqlSession;
	

//	마이 바티스를 사용해서 sql을 연결 할 수 있음.
	public static SqlSessionFactory getSqlSession(){
//		sqlsession을 리턴을 했기 때문에 getSqlSession을 사용 할 수 있다.
		return sqlSession;
	}

	static{
		try {
//			어디 패키지 안에 들어가있는 xml파일을 적으면 된다.(확장자 까지 적어줘야함)
//			패키지안에 있는걸 사용할려면 패키지를 다 적어야한다.
			String resource = "com/finad23/mybatis/dbConnect.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
//			try문 안에 있는 코드를 읽어보면 sqlSession에 담아둔다.
			sqlSession = factory.build(reader);
		} catch (Exception e) {
		}
	}
}