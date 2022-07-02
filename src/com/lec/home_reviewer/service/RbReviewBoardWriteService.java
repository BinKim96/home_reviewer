package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.ReviewBoardDao;

public class RbReviewBoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rbContent = request.getParameter("rbContent");
		String rbIp = request.getRemoteAddr();
		String mId = request.getParameter("mId");
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		int result = rbDao.writeReviewBoard(rbContent, rbIp, mId, mvId);
		if(result==ReviewBoardDao.SUCCESS) {
			request.setAttribute("reviewWriteResult", "리뷰작성성공");
		}else {
			request.setAttribute("reviewWriteResult", "리뷰작성실패");
		}

	}

}
