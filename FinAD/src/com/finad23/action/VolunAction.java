package com.finad23.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.CreatorVolun;
import com.finad23.VO.ActionForward;
import com.finad23.svc.VolunService;

public class VolunAction implements FinadAction{

	@Override
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		rq.setCharacterEncoding("UTF-8");
		String id = rq.getParameter("id");
		
		VolunService service = new VolunService();
		ArrayList<CreatorVolun> list = service.volun(id);
		ActionForward forward = new ActionForward();
		rq.setAttribute("list", list);
		forward.setPath("/popup.jsp");
		System.out.println(id);
		return forward;
	}

}