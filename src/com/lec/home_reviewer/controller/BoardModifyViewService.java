package com.lec.home_reviewer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;
import com.lec.home_reviewer.dto.BoardDto;
import com.lec.home_reviewer.service.Service;

public class BoardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto board = boardDao.modifyView_replyView(bNum);
		request.setAttribute("board", board);
	}
}
