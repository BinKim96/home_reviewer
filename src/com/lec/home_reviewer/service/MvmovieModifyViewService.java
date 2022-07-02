package com.lec.home_reviewer.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dto.MovieDto;
import com.lec.home_reviewer.dto.MovieGenreDto;
import com.lec.home_reviewer.dto.MovieGradeDto;

public class MvmovieModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mvId = Integer.parseInt(request.getParameter("mvId"));
		MovieDao mvDao = MovieDao.getInstance();
		MovieDto movie = mvDao.getMovie(mvId);
		ArrayList<MovieGenreDto> movieGenres = mvDao.getGenre();
		ArrayList<MovieGradeDto> movieGrades = mvDao.getGrade();
		request.setAttribute("movie", movie);
		request.setAttribute("movieGenres", movieGenres);
		request.setAttribute("movieGrades", movieGrades);
	}
}
