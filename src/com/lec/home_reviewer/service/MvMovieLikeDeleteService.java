package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieLikeDao;

public class MvMovieLikeDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		MovieLikeDao mlDao = MovieLikeDao.getInstance();
		int result = mlDao.deleteLike(mId, mvId);
		if(result == MovieLikeDao.SUCCESS) {
			request.setAttribute("likeDeleteResult", "좋아요 식제 성공");
		}else {
			request.setAttribute("likeDeleteResult", "좋아요 삭제 실패");
		}

	}

}
