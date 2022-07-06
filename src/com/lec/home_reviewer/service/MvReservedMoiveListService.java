package com.lec.home_reviewer.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dao.ReserveMovieDao;
import com.lec.home_reviewer.dto.MovieDto;

public class MvReservedMoiveListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			if(request.getAttribute("pageNum")==null) { // 글 수정이나 답변글처리시 mRequest를 사용하여서 request에 set함
				pageNum = "1";
			}else {
				pageNum = (String)request.getAttribute("pageNum");
			}
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=9, BLOCKSIZE=5;
		int startRow = (currentPage-1) * PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
		
		ReserveMovieDao rmDao = ReserveMovieDao.getInstance();
		String mId = request.getParameter("mId");
		ArrayList<MovieDto> reservedMovieList = rmDao.listReservedMovie(mId, startRow, endRow);
		request.setAttribute("reservedMovieList", reservedMovieList);
		int reservedmovieCnt = rmDao.getReservedMovieCnt(mId);
		int pageCnt = (int)Math.ceil((double)reservedmovieCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("reservedmovieCnt", reservedmovieCnt); 
		request.setAttribute("pageNum", currentPage);

	}

}
