package com.finad23.svc;

import com.finad23.DAO.FinadDAO;
import com.finad23.jjj.Influ_info;

import static com.finad23.db.JdbcUtil.*;

import java.sql.Connection;

public class NonMatService{
	public Influ_info nonMat(String category, String nickname) throws Exception{
		Influ_info influ_info = null;
		Connection conn = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(conn);
		
//		System.out.println(category);
//		System.out.println(nickname);
		
		influ_info = finadDAO.nonMat(category, nickname);
		close(conn);
		return influ_info;
	}
}
