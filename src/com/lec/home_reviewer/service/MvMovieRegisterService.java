package com.lec.home_reviewer.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MovieDao;
import com.lec.home_reviewer.dto.MovieDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MvMovieRegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("moviePosterUp");
		int maxSize = 1024*1024*20;
		String mvPoster = "";
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			mvPoster = mRequest.getFilesystemName(param);
			int mvId = 0;
			String mvTitle = mRequest.getParameter("mvTitle");
			int gId = Integer.parseInt(mRequest.getParameter("gId"));
			String mvReleaseDateStr = mRequest.getParameter("mvReleaseDate");
			Date mvReleaseDate = null;
			if(!mvReleaseDateStr.equals("")) {
				mvReleaseDate = Date.valueOf(mvReleaseDateStr);
			}
			String mvDirector = mRequest.getParameter("mvDirector");
			String mvCast = mRequest.getParameter("mvCast");
			String mvRunningTime = mRequest.getParameter("mvRunningTime");
			int grId = Integer.parseInt(mRequest.getParameter("grId"));
			mvPoster = mvPoster==null ? "NOIMG.JPG" : mvPoster;
			String mvContent = mRequest.getParameter("mvContent");
			Date mvRdate = null;
			MovieDao mvDao = MovieDao.getInstance();
			MovieDto movie = new MovieDto(mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent, mvRdate);
			
			// 영화 등록
			int result = mvDao.adminRegisterMovie(movie);
			if(result == mvDao.SUCCESS) {
				request.setAttribute("movieRegisterResult", "영화등록성공");
			}else {
				request.setAttribute("movieRegisterError", "영화등록실패");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		// 서버에 업로드된 파일을 소스 폴더로 복사
		File serverFile = new File(path + "/" + mvPoster);
		if(serverFile.exists() && !mvPoster.equals("NOIMG.JPG")) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\Education\\BinKim96_Home-Education\\source\\First_Personal_Project\\home_reviewer\\WebContent\\moviePosterUp\\"+mvPoster);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt==-1) break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (IOException e) {
					// TODO: handle exception
				}
			}
		}
	}
}
