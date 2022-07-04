package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.home_reviewer.dao.MemberDao;
import com.lec.home_reviewer.dto.MemberDto;

public class MMyProfileViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = mDao.getMember(mId);
		request.setAttribute("member", member);
	}
}
