package com.lec.home_reviewer.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.home_reviewer.dto.MemberDto;

public class MemberDao {
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {}
	// 커넥션함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// (1) mId 중복 체크
	public int mIdConfirm(String mId) {
		int result = EXISTENT;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (2) mEmail 중복 체크
	public int mEmailConfirm(String mEmail) {
		int result = EXISTENT;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mEmail=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (3) 회원가입
	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender)" + 
				"                VALUES(?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmId());
			pstmt.setString(2, member.getmPw());
			pstmt.setString(3, member.getmName());
			pstmt.setString(4, member.getmEmail());
			pstmt.setString(5, member.getmPhoto());
			pstmt.setString(6, member.getmGender());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (4) 회원로그인
	public int memberLogin(String mId, String mPw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=? AND mPw=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
				System.out.println("회원 로그인 성공");
			}else {
				result = LOGIN_FAIL;
				System.out.println("회원 로그인 실패");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"로그인실패");
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (5) mId로 MemberDto가져오기(로그인 성공시 session에 넣기 위함)
	public MemberDto getMember(String mId) {
		MemberDto member = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mPw = rs.getString("mPw");
				String mName = rs.getString("mName");
				String mEmail = rs.getString("mEmail");
				String mPhoto = rs.getString("mPhoto");
				String mGender = rs.getString("mGender");
				Date mRdate = rs.getDate("mRdate");
				int mReviewCnt = rs.getInt("mReviewCnt");
				member = new MemberDto(mId, mPw, mName, mEmail, mPhoto, mGender, mRdate, mReviewCnt);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return member;
	}
	// (6) 회원정보수정
	public int modifyMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET mPW=?," + 
				"                      mName=?," + 
				"                      mEmail=?," + 
				"                      mPhoto=?," + 
				"                      mGender=?" + 
				"                WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmPw());
			pstmt.setString(2, member.getmName());
			pstmt.setString(3, member.getmEmail());
			pstmt.setString(4, member.getmPhoto());
			pstmt.setString(5, member.getmGender());
			pstmt.setString(6, member.getmId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (7) 회원리스트(top-N구문 관리자용)
	public ArrayList<MemberDto> listMember(int startRow, int endRow) {
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM" + 
				"                        (SELECT * FROM MEMBER ORDER BY mRdate DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String mId = rs.getString("mId");
				String mPw = rs.getString("mPw");
				String mName = rs.getString("mName");
				String mEmail = rs.getString("mEmail");
				String mPhoto = rs.getString("mPhoto");
				String mGender = rs.getString("mGender");
				Date mRdate = rs.getDate("mRdate");
				int mReviewCnt = rs.getInt("mReviewCnt");
				members.add(new MemberDto(mId, mPw, mName, mEmail, mPhoto, mGender, mRdate, mReviewCnt));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return members;
	}
	// (8) 회원수
	public int getMemberCnt() {
		int memberCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM MEMBER";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return memberCnt;
	}
	// (9) 아이디 또는 이름으로 회원검색(관리자용)
	public ArrayList<MemberDto> searchMember(String schId, String schName) {
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId LIKE '%'||?||'%' OR mName LIKE '%'||?||'%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schId);
			pstmt.setString(2, schName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String mId = rs.getString("mid");
				String mPw = rs.getString("mPw");;
				String mName = rs.getString("mName");;
				String mEmail = rs.getString("mEmail");;
				String mPhoto = rs.getString("mPhoto");;
				String mGender = rs.getString("mGender");;
				Date mRdate = rs.getDate("mRdate");
				int mReviewCnt = rs.getInt("mReviewCnt");
				members.add(new MemberDto(mId, mPw, mName, mEmail, mPhoto, mGender, mRdate, mReviewCnt));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return members;
	}
}
