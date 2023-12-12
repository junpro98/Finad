package com.finad23.svc;

import java.sql.Connection;
import java.util.ArrayList;

import com.finad23.DAO.FinadDAO;
import com.finad23.DTO.CreatorVolun;
import static com.finad23.db.JdbcUtil.*;

public class VolunService {
	public ArrayList<CreatorVolun> volun(String id) throws Exception {
		ArrayList<CreatorVolun> list = null;
		Connection conn = getConnection();
		FinadDAO dao = FinadDAO.getInstance();
		dao.setConnection(conn);
//		System.out.println(id);
		list = dao.volun(id);
		
		return list;
	}
}
