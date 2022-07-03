package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieLikeDao;

public class MvMovieCountLikeService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		MovieLikeDao mlDao = MovieLikeDao.getInstance();
		int result = mlDao.checkLike(mId, mvId);
		request.setAttribute("likeCount", result);
	}
}
