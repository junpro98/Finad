package com.finad23.svc;

import java.sql.Connection;
import java.util.ArrayList;

import com.finad23.DAO.FinadDAO;
import com.finad23.jjj.Influ_info;

import static com.finad23.db.JdbcUtil.*;
public class CompareService {
	public ArrayList<Influ_info> diffCre(String category) throws Exception {
		
		ArrayList<Influ_info> info = null;
		Connection conn = getConnection();
		FinadDAO finadDAO = FinadDAO.getInstance();
		finadDAO.setConnection(conn);
		
		info =finadDAO.diifCre(category);
		
		close(conn);
		return info;
		
	}
}
