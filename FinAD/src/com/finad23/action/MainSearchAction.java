package com.finad23.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.VO.ActionForward;
import com.finad23.jjj.Influ_info;
import com.finad23.svc.MainSearchService;

public class MainSearchAction implements FinadAction {

	@Override
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		String nickname = rq.getParameter("main_search");
		MainSearchService mainSearchService = new MainSearchService();
		ArrayList<Influ_info> article = mainSearchService.getAtricle(nickname);
		
		ActionForward forward = new ActionForward();
		rq.setAttribute("nickname", nickname);
		rq.setAttribute("article", article);
		forward.setPath("/categoryAll.jsp");
//		System.out.println("action " + nickname);
		return forward;
	}

}
