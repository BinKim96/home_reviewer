package com.lec.home_reviewer.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.ReviewBoardDao;

public class RbReviewBoardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rbContent = request.getParameter("rbContent");
		String rbIp = request.getRemoteAddr();
		int rbNum = Integer.parseInt(request.getParameter("rbNum"));
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		String mId = request.getParameter("mId");
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		int result = rbDao.modifyReviewBoard(rbContent, rbIp, rbNum, mvId, mId);
		if(result == ReviewBoardDao.SUCCESS) { // 회원가입 진행
			request.setAttribute("reviewBoardMoifyResult", "리뷰수정 성공");
		}else {
			request.setAttribute("reviewBoardMoifyErrorMsg", "리뷰수정 실패");
		}
	}

}
