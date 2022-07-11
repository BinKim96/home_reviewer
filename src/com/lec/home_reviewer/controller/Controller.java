package com.lec.home_reviewer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.service.ALoginService;
import com.lec.home_reviewer.service.BoardContentService;
import com.lec.home_reviewer.service.BoardDeleteService;
import com.lec.home_reviewer.service.BoardListService;
import com.lec.home_reviewer.service.BoardModifyService;
import com.lec.home_reviewer.service.BoardModifyViewService;
import com.lec.home_reviewer.service.BoardReplyService;
import com.lec.home_reviewer.service.BoardReplyViewService;
import com.lec.home_reviewer.service.BoardWriteService;
import com.lec.home_reviewer.service.LogoutService;
import com.lec.home_reviewer.service.MJoinService;
import com.lec.home_reviewer.service.MLoginService;
import com.lec.home_reviewer.service.MMemberListService;
import com.lec.home_reviewer.service.MModifyService;
import com.lec.home_reviewer.service.MModifyViewService;
import com.lec.home_reviewer.service.MemailConfirmService;
import com.lec.home_reviewer.service.MidConfirmService;
import com.lec.home_reviewer.service.MvMovieListService;
import com.lec.home_reviewer.service.MvMovieModifyService;
import com.lec.home_reviewer.service.MvMovieRegisterService;
import com.lec.home_reviewer.service.MvMovieReserveDeleteService;
import com.lec.home_reviewer.service.MvMovieReserveInsertService;
import com.lec.home_reviewer.service.MvMovieSearchListService;
import com.lec.home_reviewer.service.MvReservedMoiveListService;
import com.lec.home_reviewer.service.MvMainMovieListService;
import com.lec.home_reviewer.service.MvMovieCountLikeService;
import com.lec.home_reviewer.service.MvMovieCountReserveService;
import com.lec.home_reviewer.service.MvMovieDeleteService;
import com.lec.home_reviewer.service.MvMovieLikeDeleteService;
import com.lec.home_reviewer.service.MvMovieLikeInsertService;
import com.lec.home_reviewer.service.MvmovieContentService;
import com.lec.home_reviewer.service.MvmovieModifyViewService;
import com.lec.home_reviewer.service.MvmovieRegisterViewService;
import com.lec.home_reviewer.service.RbReviewBoardDeleteService;
import com.lec.home_reviewer.service.RbReviewBoardListService;
import com.lec.home_reviewer.service.RbReviewBoardModifyService;
import com.lec.home_reviewer.service.RbReviewBoardModifyViewService;
import com.lec.home_reviewer.service.RbReviewBoardWriteService;
import com.lec.home_reviewer.service.Service;
import com.lec.home_reviewer.service.MMyProfileViewService;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com     = uri.substring(conPath.length()); // 들어온 요청
		String viewPage = null;
		Service service = null;
		
		if(com.equals("/main.do")) { // 첫화면0
			service = new MvMainMovieListService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		/**************************************	
		************ member 관련 요청 ************	
		**************************************/	
		}else if(com.equals("/loginView.do")) { // 로그인 화면으로 0
			viewPage = "member/login.jsp";
			
		}else if(com.equals("/memberLogin.do")) { // 사용자 로그인 실행0
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/logout.do")) { // 로그아웃 실행0
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/joinView.do")) { // 회원가입 화면으로(비회원)0
			viewPage = "member/join.jsp";
			
		}else if (com.equals("/idConfirm.do")) { // 아이디 중복체크 실행(비회원)0
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/mIdConfirm.jsp";
			
		}else if (com.equals("/emailConfirm.do")) { // 이메일 중복체크 실행(비회원)0
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/mEmailConfirm.jsp";
			
		}else if(com.equals("/memberJoin.do")) { // 회원가입 실행(비회원)0
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
			
		}else if(com.equals("/myPageView.do")) { // 마이페이지 가기(회원)0
			viewPage = "member/myPage.jsp";
			
		}else if(com.equals("/myProfileView.do")) { // 마이프로필 페이지 가기(회원)0
			service = new MMyProfileViewService();
			service.execute(request, response);
			viewPage = "member/myProfile.jsp";
			
		}else if(com.equals("/memberModifyView.do")) { // 회원정보수정페이지 가기(회원)0
			service = new MModifyViewService();
			service.execute(request, response);
			viewPage = "member/modify.jsp";
			
		}else if(com.equals("/memberModify.do")) { // 회원정보수정하기(회원)0
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "loginView.do";
			
		}else if(com.equals("/memberList.do")) { // 회원 목록 출력하기(관리자)0
			service = new MMemberListService();
			service.execute(request, response);
			viewPage = "member/memberList.jsp";
		/**************************************
		************ admin 관련 요청 ************
		***************************************/
		}else if(com.equals("/adminLoginView.do")) { // 관리자 로그인 페이지가기(관리자)0
			viewPage = "admin/adminLogin.jsp";
		}else if(com.equals("/adminLogin.do")) { // 관리자 로그인 실행(관리자)0
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp"; 
		/**************************************
		************ board 관련 요청 ************
		***************************************/
		}else if(com.equals("/boardList.do")) { // 자유게시판 글 목록 출력하기(공통)0
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
			
		}else if(com.equals("/boardWriteView.do")) { // 자유게시판 글 작성페이지 가기(회원)0
			viewPage = "board/boardWrite.jsp";
			
		}else if(com.equals("/boardWrite.do")) { // 자유게시판 글 작성하기(회원)0
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardContent.do")) { // 자유게시판 특정글 보기(공통)0
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(com.equals("/boardDelete.do")) { // 자유게시판 특정글 삭제하기(공통)0
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardModifyView.do")) { // 자유게시판 게시글 수정페이지 가기(회원)0
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";
			
		}else if(com.equals("/boradModify.do")) { // 자유게시판 게시글 수정하기(회원)0
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(com.equals("/boardReplyView.do")) { // 자유게시판 답글페이지 가기(회원)0
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";
			
		}else if(com.equals("/boardReply.do")) { // 자유게시판 답글달기(회원)0
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		/**************************************
		************ movie 관련 요청 ************
		***************************************/
		}else if(com.equals("/movieContent.do")) { 
			service = new MvmovieContentService(); // 영화상세보기(공통)0
			service.execute(request, response);
			service = new RbReviewBoardListService();  // 리뷰목록출력(공통)0
			service.execute(request, response);
			service = new MvMovieCountLikeService(); // 좋아요 여부 확인(회원)0 
			service.execute(request, response);
			service = new MvMovieCountReserveService(); // 찜하기 여부 확인(회원)0
			service.execute(request, response);
			viewPage = "movie/movieContent.jsp";
			
		}else if(com.equals("/movieList.do")) { // 영화목록출력하기 (공통)0
			service = new MvMovieListService();
			service.execute(request, response);
			viewPage = "movie/moiveList.jsp";
			
		}else if(com.equals("/movieRegisterView.do")) { // 영화등록페이지가기(관리자)0
			service = new MvmovieRegisterViewService();
			service.execute(request, response);
			viewPage = "movie/movieRegister.jsp";
			
		}else if(com.equals("/movieRegister.do")) { // 영화등록하기(관리자)0
			service = new MvMovieRegisterService();
			service.execute(request, response);
			viewPage = "movieList.do";
		}else if(com.equals("/movieModifyView.do")) { // 영화수정페이지가기(관리자)0
			service = new MvmovieModifyViewService();
			service.execute(request, response);
			viewPage = "movie/movieModify.jsp";
		
		}else if(com.equals("/movieMoidfy.do")) { // 영화수정하기(관리자)0
			service = new MvMovieModifyService();
			service.execute(request, response);
			viewPage = "movieList.do";
			
		}else if(com.equals("/movieDelete.do")) { // 영화삭제하기(관리자)0
			service = new MvMovieDeleteService();
			service.execute(request, response);
			viewPage = "movieList.do";
			
		}else if(com.equals("/movieSearchList.do")) { // 영화검색목록출력하기(공통)0
			service = new MvMovieSearchListService();
			service.execute(request, response);
			viewPage = "movie/movieSearchList.jsp";
		
		}else if(com.equals("/movieLikeInsert.do")) { // 좋아요 추가 (회원)0
			service = new MvMovieLikeInsertService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/movieLikeDelete.do")) { // 추가한 좋아요 삭제 (회원)0	
			service = new MvMovieLikeDeleteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/movieReserveInsert.do")) { // 영화 찜하기 (회원)0
			service = new MvMovieReserveInsertService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/movieReserveDelete.do")) { // 영화 찜하기 취소 (회원)0
			service = new MvMovieReserveDeleteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/reservedMoiveList.do")) { // 찜한 영화 목록 출력(회원)0
			service = new MvReservedMoiveListService();
			service.execute(request, response);
			viewPage = "movie/reservedMoiveList.jsp";
			
		/**************************************
		************ reviewboard 관련 요청 ************
		***************************************/
		}else if(com.equals("/reviewBoardWrite.do")) { // 리뷰 작성하기(회원)0
			service = new RbReviewBoardWriteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/reviewBoardDelete.do")) { // 리뷰 삭제하기(공통)0
			service = new RbReviewBoardDeleteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(com.equals("/reviewModifyView.do")) { // 리뷰 수정 페이지 가기(회원)0
			service = new RbReviewBoardModifyViewService();
			service.execute(request, response);
			viewPage = "movie/reviewModifyView.jsp";
			
		}else if(com.equals("/reviewModify.do")) { // 리뷰 수정하기 (회원)0
			service = new RbReviewBoardModifyService();
			service.execute(request, response);
			viewPage = "movieContent.do";
		}
		
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
