package com.finad23.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.finad23.DTO.SellerDTO;
import com.finad23.mybatis.SellerConn;

public class SellerExtr implements ConInter {
    static SellerExtr extr = new SellerExtr();
    public static SellerExtr instance() {
        return extr;
    }

    @Override
    public String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
        SellerConn conn = SellerConn.instance();
       
        String sell = rq.getParameter("url");
        SellerDTO adr = new SellerDTO();
        List<SellerDTO> list = conn.sqlSelect(sell);
        
        rq.setAttribute("List", list);
        return null;
    }
}
