package com.lec.home_reviewer.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dto.MovieDto;
import com.sun.org.apache.bcel.internal.generic.LASTORE;

public class MvMainMovieListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MovieDao mDao = MovieDao.getInstance();
		HttpSession session = request.getSession();
		ArrayList<MovieDto> lastMovies = mDao.listLastMovie();
		//request.setAttribute("lastMovies", lastMovies);
		session.setAttribute("lastMovies", lastMovies);
		ArrayList<MovieDto> popularMovies = mDao.listPopularMovie();
		//request.setAttribute("popularMovies", popularMovies);
		session.setAttribute("popularMovies", popularMovies);
	}
}
