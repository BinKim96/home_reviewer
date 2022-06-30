package com.lec.home_reviewer.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.home_reviewer.dao.AdminDao;
import com.lec.home_reviewer.dao.MemberDao;
import com.lec.home_reviewer.dto.AdminDto;
import com.lec.home_reviewer.dto.MemberDto;

public class ALoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aId = request.getParameter("aId");
		String aPw = request.getParameter("aPw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.adminLogin(aId, aPw);
		if(result==AdminDao.LOGIN_SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aId);
			session.setAttribute("admin", admin);
		}else {
			request.setAttribute("loginErrorMsg", "아이디와 비번을 확인하세요");
		}

	}

}
