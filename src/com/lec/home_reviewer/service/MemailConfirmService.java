package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MemberDao;

public class MemailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mEmail = request.getParameter("mEmail");
		MemberDao mDao = MemberDao.getInstance();
		// mEamil 중복체크
		int result = mDao.mEmailConfirm(mEmail);
		if(result == MemberDao.NONEXISTENT) {
			request.setAttribute("emailConfirmResult", "<b>사용 가능한 이메일</b>");
		}else {
			request.setAttribute("emailConfirmResult", "<b>중복된 이메일</b>");
		}
	}
}
