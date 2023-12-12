package com.finad23.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.jjj.Influ_info;
import com.finad23.mybatis.CategoryConn;

public class CategoryExtr implements ConInter{// DB 처리 결과를 알려주는 파일

	static CategoryExtr extr = new CategoryExtr();
	public static CategoryExtr instance() {
		return extr;
	}
	
	@Override
	public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		CategoryConn conn = CategoryConn.instance();
		
		String cate = rq.getParameter("url");
		Influ_info inf = new Influ_info();
		inf.setCategory(cate);
		List<Influ_info> list = conn.sqlSelect(inf);
//		select 쿼리문이 있는 클래스의 객체 매소드 호출
//		setAttribute를 통해 list를 set 해준다.
		
		rq.setAttribute("List", list);
		return null;
	}

}
