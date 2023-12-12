package com.finad23.svc;

import java.sql.Connection;
import java.util.ArrayList;

import com.finad23.DAO.FinadDAO;
import com.finad23.jjj.Influ_info;
import static com.finad23.db.JdbcUtil.*;


public class MainSearchService {
	
	public ArrayList<Influ_info> getAtricle(String nickname) throws Exception{
		ArrayList<Influ_info> article = null;
		Connection conn = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(conn);
		
		article = finadDAO.search(nickname);
		close(conn);
//		System.out.println("service " + nickname);
		return article;
		
	}
}
