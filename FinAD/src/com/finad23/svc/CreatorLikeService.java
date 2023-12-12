package com.finad23.svc;

import java.sql.Connection;

import com.finad23.DAO.FinadDAO;
import com.finad23.DTO.UserLikeDTO;

import static com.finad23.db.JdbcUtil.*;

public class CreatorLikeService {
	
	public boolean likeArticle(UserLikeDTO likeDTO) throws Exception {
		
		boolean countSuccess = false;
		
		Connection con = getConnection();
		FinadDAO dao = FinadDAO.getInstance();
		dao.setConnection(con);
		
		int likeCount = dao.creatorLike(likeDTO);
//		UserLikeDTO likeDTO2 = dao.likeSelect();
		
		if(likeCount > 0) {
			commit(con);
			countSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return countSuccess;
		
	}
	
}
