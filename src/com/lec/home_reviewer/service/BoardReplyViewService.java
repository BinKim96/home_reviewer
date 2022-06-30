package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;
import com.lec.home_reviewer.dto.BoardDto;

public class BoardReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto originBoard = boardDao.modifyView_replyView(bNum);
		request.setAttribute("originBoard", originBoard);
	}
}
