package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.ReviewBoardDao;
import com.lec.home_reviewer.dto.ReviewBoardDto;

public class RbReviewBoardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rbNum = Integer.parseInt(request.getParameter("rbNum"));
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		ReviewBoardDto reviewBoard = rbDao.reviewModifyView(rbNum);
		request.setAttribute("reviewBoard", reviewBoard);
	}
}
