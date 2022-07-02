package com.lec.home_reviewer.service;

import java.io.File;
import java.io.FileInputStream;
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

public class MvMovieModifyService implements Service {

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
			int mvId = Integer.parseInt(mRequest.getParameter("mvId"));
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
			String dbmvPoster = mRequest.getParameter("dbmvPoster");
			mvPoster = (mvPoster==null)? dbmvPoster : mvPoster;
			String mvContent = mRequest.getParameter("mvContent");
			MovieDao mvDao = MovieDao.getInstance();
			MovieDto movie = new MovieDto(mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent, null);
			int result = mvDao.modifyMovie(mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, dbmvPoster, mvContent);
			if(result == MovieDao.SUCCESS) {
				request.setAttribute("movieModifyResult", "영화정보수정성공");
			}else {
				request.setAttribute("movieModifyError", "영화정보수정실패");
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
