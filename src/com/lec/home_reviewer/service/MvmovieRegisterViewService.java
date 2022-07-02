package com.lec.home_reviewer.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dto.MovieGenreDto;
import com.lec.home_reviewer.dto.MovieGradeDto;

public class MvmovieRegisterViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MovieDao mvDao = MovieDao.getInstance();
		ArrayList<MovieGenreDto> movieGenres = mvDao.getGenre();
		ArrayList<MovieGradeDto> movieGrades = mvDao.getGrade();
		request.setAttribute("movieGenres", movieGenres);
		request.setAttribute("movieGrades", movieGrades);
	}

}
