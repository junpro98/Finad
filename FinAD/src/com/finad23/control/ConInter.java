package com.finad23.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 인터페이스 만들어 둔거임
// 만약 인터페이스가 여려개 만들어야 하면 새로 인터페이스를 생성하면 됨.
public interface ConInter {
	String FinAD(HttpServletRequest rq, HttpServletResponse rs) throws Exception;
}
