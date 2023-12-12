package com.finad23.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.VO.ActionForward;
import com.finad23.jjj.Influ_info;
import com.finad23.svc.NonMatService;

public class NonMatAction implements FinadAction{

	@Override
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		rq.setCharacterEncoding("UTF-8");
		String category = rq.getParameter("category");
		String nickname = rq.getParameter("nickname");
		
//		System.out.println(category);
//		System.out.println(nickname);
		
		NonMatService nonMatService = new NonMatService();
		Influ_info influ_info = nonMatService.nonMat(category, nickname);
		ActionForward actionForward = new ActionForward();
		rq.setAttribute("influ_info", influ_info);
		actionForward.setPath("/Test123.jsp");
		
		return actionForward;
	}

}
