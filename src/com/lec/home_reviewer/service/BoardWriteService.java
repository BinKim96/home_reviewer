package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;

public class BoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bip = request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		request.setAttribute("boardWriteResult", bDao.writeBoard(mId, bTitle, bContent, bip));
	}
}
