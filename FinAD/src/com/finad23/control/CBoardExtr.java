package com.finad23.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.CompanyBoardDTO;
import com.finad23.mybatis.CBoardConn;

public class CBoardExtr implements ConInter { //광고게시판 Extract == 추출이라는 뜻

	static CBoardExtr dbExtract = new CBoardExtr();
	public static CBoardExtr instance() {
		return dbExtract;
	}
	@Override
	public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		CBoardConn select = CBoardConn.instance();
		List<CompanyBoardDTO> list = select.dbSelect();
		rq.setAttribute("List", list);
		
		return null;
	}
}
