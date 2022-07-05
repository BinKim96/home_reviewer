package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MemberDao;

public class MidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		MemberDao mDao = MemberDao.getInstance();
		// ID 중복체크
		int result = mDao.mIdConfirm(mId);
		if(result == MemberDao.NONEXISTENT) {
			request.setAttribute("idConfirmResult", "사용 가능한 아이디");
		}else {
			request.setAttribute("idConfirmResult", "<b>중복된 아이디</b>");
		}
	}
}
