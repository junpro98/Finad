package com.finad23.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.VO.ActionForward;
import com.finad23.jjj.Influ_info;
import com.finad23.svc.CompareService;

public class CompareAction implements FinadAction{

	@Override
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		rq.setCharacterEncoding("UTF-8");
		String category = rq.getParameter("hidden_category");
		
		CompareService creService = new CompareService();
		ArrayList<Influ_info> info = creService.diffCre(category);
		ActionForward forward = new ActionForward();
		rq.setAttribute("info", info);
//		System.out.println(category);
		forward.setPath("/compare.jsp");
		
		return forward;
	}

}
