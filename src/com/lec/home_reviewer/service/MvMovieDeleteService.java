package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;

public class MvMovieDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		MovieDao mvDao = MovieDao.getInstance();
		int result = mvDao.deleteMovie(mvId);
		if(result == MovieDao.SUCCESS) {
			request.setAttribute("movieDeleteResult", "영화삭제 성공");
		}else {
			request.setAttribute("movieDeleteError", "영화삭제 실패");
		}
	}
}
