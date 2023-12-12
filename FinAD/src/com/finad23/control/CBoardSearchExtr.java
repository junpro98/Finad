package com.finad23.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.CompanyBoardDTO;
import com.finad23.mybatis.CBoardSearchConn;

public class CBoardSearchExtr implements ConInter {

    static CBoardSearchExtr dbExtract = new CBoardSearchExtr();
    public static CBoardSearchExtr instance() {
        return dbExtract;
    }
    @Override
    public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
        CBoardSearchConn select = CBoardSearchConn.instance();
        
        System.out.println(rq.getParameter("type"));
        rq.setAttribute("searchQuery", rq.getParameter("company_board_search"));

        // 검색 파라미터를 Map에 담아 전달
        Map<String, Object> params = new HashMap<>();
        params.put("type", rq.getParameter("type"));
        params.put("duration", rq.getParameter("duration"));
        params.put("category", rq.getParameter("category"));
        params.put("search", rq.getParameter("company_board_search"));

        List<CompanyBoardDTO> list = select.dbSelect(params);
        rq.setAttribute("List", list);

        return null;
    }
}
