package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;
import com.lec.home_reviewer.dto.BoardDto;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto board = boardDao.contentView(bNum);
		request.setAttribute("board", board);
	}
}
