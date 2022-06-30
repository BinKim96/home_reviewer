package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dto.MovieDto;

public class MvmovieContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		MovieDao mvDao = MovieDao.getInstance();
		MovieDto movie = mvDao.getMovie(mvId);
		request.setAttribute("movie", movie);

	}

}
