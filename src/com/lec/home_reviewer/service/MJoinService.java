package com.lec.home_reviewer.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.home_reviewer.dao.MemberDao;
import com.lec.home_reviewer.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024*20; // 용량제한 20MB
		String mPhoto = ""; // 첨부된 파일이 저장된 파일 이름
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			mPhoto = mRequest.getFilesystemName(param);
			String mId = mRequest.getParameter("mId");
			String mPw = mRequest.getParameter("mPw");
			String mName = mRequest.getParameter("mName");
			String mEmail = mRequest.getParameter("mEmail");
			mPhoto = mPhoto==null ? "NOIMG.JPG" : mPhoto;
			String mGender = mRequest.getParameter("mGender");
			MemberDao mDao = MemberDao.getInstance();
			MemberDto member = new MemberDto(mId, mPw, mName, mEmail, mPhoto, mGender, null, 0);
			
			// 회원가입
			int result = mDao.joinMember(member);
			if(result == MemberDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("mId", mId); // 로그인창에 띄울 아이디
				request.setAttribute("joinResult", "회원가입완료");
				System.out.println("회원가입완료");
			}else {
				request.setAttribute("joinErrorMsg", "회원가입 실패");
				System.out.println("회원가입실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// 서버에 업로드된 파일을 소스 폴더로 복사
		File serverFile = new File(path + "/" + mPhoto);
		if(serverFile.exists() && !mPhoto.equals("NOIMG.JPG")) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\Education\\BinKim96_Home-Education\\source\\First_Personal_Project\\home_reviewer\\WebContent\\memberPhotoUp\\"+mPhoto);
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
					// TODO Auto-generated catch block
				}
			}
		}
	}
}
