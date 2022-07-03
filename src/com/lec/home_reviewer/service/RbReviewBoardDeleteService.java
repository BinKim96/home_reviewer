package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.ReviewBoardDao;

public class RbReviewBoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rbNum = Integer.parseInt(request.getParameter("rbNum"));
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		int result = rbDao.deleteReviewBoard(rbNum);
		if(result == ReviewBoardDao.SUCCESS) {
			request.setAttribute("boardDeleteResult", "댓글삭제 성공");
		}else {
			request.setAttribute("boardDeleteResult", "댓글삭제 실패");
		}
	}
}
