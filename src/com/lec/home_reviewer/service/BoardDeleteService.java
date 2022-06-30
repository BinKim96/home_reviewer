package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.deleteBoard(bNum);
		if(result == BoardDao.SUCCESS) {
			request.setAttribute("boardDeleteResult", "글삭제 성공");
		}else {
			request.setAttribute("boardDeleteResult", "글삭제 실패");
		}
	}

}
