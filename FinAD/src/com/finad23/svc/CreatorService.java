package com.finad23.svc;



import java.sql.Connection;

import com.finad23.DAO.FinadDAO;
import com.finad23.jjj.Influ_info;
import static com.finad23.db.JdbcUtil.*;

public class CreatorService {
	
	public Influ_info getArticle(String nickname) throws Exception {
		
		Influ_info article = null;
		Connection conn = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(conn);
//		System.out.println("서비스 " + nickname);

		
		article = finadDAO.creator(nickname);
		close(conn);
		return article;

	}
	
}