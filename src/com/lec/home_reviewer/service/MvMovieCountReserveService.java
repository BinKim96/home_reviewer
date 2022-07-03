package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.ReserveMovieDao;

public class MvMovieCountReserveService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		ReserveMovieDao rmDao = ReserveMovieDao.getInstance();
		int result = rmDao.checkReserve(mId, mvId);
		request.setAttribute("reserveCount", result);
	}
}
