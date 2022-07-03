package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieLikeDao;
import com.lec.home_reviewer.dao.ReserveMovieDao;

public class MvMovieReserveInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		ReserveMovieDao rmDao = ReserveMovieDao.getInstance();
		int result = rmDao.insertReserve(mId, mvId);
		if(result == MovieLikeDao.SUCCESS) {
			request.setAttribute("reserveInsertResult", "찜 삽입 성공");
		}else {
			request.setAttribute("reserveInsertResult", "찜 삽입 실패");
		}
	}

}
