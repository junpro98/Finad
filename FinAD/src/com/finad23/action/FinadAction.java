package com.finad23.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finad23.VO.ActionForward;

public interface FinadAction {
	public ActionForward excute(HttpServletRequest rq, HttpServletResponse rs) throws Exception;
}
