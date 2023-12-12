package com.finad23.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.CompanyUserDTO;
import com.finad23.DTO.CompanyUserMypageDTO;
import com.finad23.mybatis.CUserConn;

public class CUserExtr implements ConInter { //기업 Extract == 추출이라는 뜻

	static CUserExtr dbExtract = new CUserExtr();
	public static CUserExtr instance() {
		return dbExtract;
	}
	@Override
	public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		CUserConn select = CUserConn.instance();
		String cid = rq.getParameter("userId");
		List<CompanyUserMypageDTO> list = select.dbSelect(cid);
		rq.setAttribute("List", list);	
		return null;
	}
}
