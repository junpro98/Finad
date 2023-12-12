package com.finad23.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.finad23.svc.BoardListService;
import com.finad23.VO.ActionForward;
import com.finad23.DTO.BoardDTO;
import com.finad23.VO.PageInfo;
//import com.finad23.action.FinadAction;


 public class BoardListAction implements FinadAction {
	 
	 public ActionForward excute(HttpServletRequest rq,HttpServletResponse rs) throws Exception{
		 
		ArrayList<BoardDTO> articleList=new ArrayList<BoardDTO>();
	  	int page=1;
		int limit=10;
		
		if(rq.getParameter("page")!=null){
			page=Integer.parseInt(rq.getParameter("page"));
		}

		
		BoardListService boardListService = new BoardListService();
		int listCount=boardListService.getListCount();
		articleList = boardListService.getArticleList(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		rq.setAttribute("pageInfo", pageInfo);
		rq.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/free_board.jsp");
   		return forward;
   		
	 }
	 
 }