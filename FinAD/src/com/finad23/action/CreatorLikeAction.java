package com.finad23.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.DTO.UserLikeDTO;
import com.finad23.VO.ActionForward;
import com.finad23.svc.CreatorLikeService;

public class CreatorLikeAction implements FinadAction{

	@Override
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		UserLikeDTO likeDTO = new UserLikeDTO();
		
		String id = rq.getParameter("id");
		String userNickname = rq.getParameter("nickname");
//		System.out.println("액션 "+id);
//		System.out.println("액션 "+userNickname);
//		
		likeDTO.setId(id);
		likeDTO.setNickName(userNickname);
		CreatorLikeService likeService = new CreatorLikeService();
		boolean like = likeService.likeArticle(likeDTO);
		
		rq.setAttribute("like", likeDTO);
		forward.setPath("test01.jsp");
		
		return forward;
	}

}