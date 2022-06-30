package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.BoardDao;

public class BoardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		int bStep = Integer.parseInt(request.getParameter("bStep"));
		int bIndent = Integer.parseInt(request.getParameter("bIndent"));
		String bIp = request.getRemoteAddr();
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.replyBoard(mId, bTitle, bContent, bGroup, bStep, bIndent, bIp);
		if(result == BoardDao.SUCCESS) { // 회원가입 진행
			request.setAttribute("boardReplyResult", "답글쓰기 성공");
		}else {
			request.setAttribute("boardReplyResult", "답글쓰기 실패");
		}
	}
}
