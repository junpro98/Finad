package com.finad23.svc;

import static com.finad23.db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import com.finad23.DAO.FinadDAO;
import com.finad23.DTO.BoardDTO;


public class BoardListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(con);
		listCount = finadDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<BoardDTO> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<BoardDTO> articleList = null;
		Connection con = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(con);
		articleList = finadDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
