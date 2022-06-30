package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;

public class BoardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bIp = request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.modifyBoard(bNum, bTitle, bContent, bIp);
		if(result == BoardDao.SUCCESS) { // 회원가입 진행
			request.setAttribute("boardMoifyResult", "글수정 성공");
		}else {
			request.setAttribute("boardModifyResult", "글수정 실패");
		}
	}
}
