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

import com.lec.home_reviewer.dto.BoardDto;
import com.lec.home_reviewer.dto.ReviewBoardDto;

public class ReviewBoardDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0; 
	// 싱글톤
	private static ReviewBoardDao instance = new ReviewBoardDao();
	public static ReviewBoardDao getInstance() {
		return instance;
	}
	private ReviewBoardDao() {}
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
	// (1) 리뷰 작성
	public int writeReviewBoard(String rbContent, String rbIp, String mId, int mvId) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId)" + 
				"        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rbContent);
			pstmt.setString(2, rbIp);
			pstmt.setString(3, mId);
			pstmt.setInt(4, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰작성성공":"리뷰쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	// (2) 해당영화리뷰목록 (사용자,관리자)-> startRow~endRow
	public ArrayList<ReviewBoardDto> listReviewBoard(int mvId, int startRow, int endRow){
		ArrayList<ReviewBoardDto> dtos = new ArrayList<ReviewBoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT *" + 
				"        FROM(SELECT ROWNUM RN, A.* FROM(SELECT rbNum, mId, rbContent, rbRdate, rbIp FROM REVIEW_BOARD WHERE mvId=? ORDER BY rbRdate DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rbNum = rs.getInt("rbNum");
				String mId = rs.getString("mId");
				String rbContent = rs.getString("rbContent");
				Date rbRdate = rs.getDate("rbRdate");
				String rbIp = rs.getString("rbIp");
				dtos.add(new ReviewBoardDto(rbNum, rbContent, rbRdate, rbIp, mId, mvId));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return dtos;
	}
	// (2)-1 해당영화리뷰 갯수
	public int getReviewBoardCnt(int mvId) {
		int reviewBoardCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM REVIEW_BOARD WHERE mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reviewBoardCnt = rs.getInt(1);
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
		return reviewBoardCnt;
	}
	// (3) 리뷰수정(사용자)
	public int modifyReviewBoard(String rbContent, String rbIp, int rbNum, int mvId, String mId) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEW_BOARD SET rbContent=?," + 
				"                            rbRdate=SYSDATE," + 
				"                            rbIp=?" + 
				"                    WHERE rbNum=? AND mvId=? AND mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rbContent);
			pstmt.setString(2, rbIp);
			pstmt.setInt(3, rbNum);
			pstmt.setInt(4, mvId);
			pstmt.setString(5, mId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰수정성공":"리뷰수정실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return result;
	}
	//(3)-1 rbNum으로 reviewBoardDto보기
	public ReviewBoardDto reviewModifyView(int rbNum) {
		ReviewBoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM REVIEW_BOARD WHERE rbNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rbNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String rbContent = rs.getString("rbContent");
				Date rbRdate = rs.getDate("rbRdat");
				String rbIp = rs.getString("rbIp");
				String mId = rs.getString("mId");
				int mvId = rs.getInt("mvId");
				dto = new ReviewBoardDto(rbContent, rbRdate, rbIp, mId, mvId);
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
		return dto;
	}
	// (4) 리뷰삭제(사용자, 관리자)
	public int deleteReviewBoard(int rbNum) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM REVIEW_BOARD WHERE rbNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rbNum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰삭제성공":"리뷰삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	// (5) 자신이 작성한 댓글 목록
	public ArrayList<ReviewBoardDto> listMyReviewBoard(String mId, int startRow, int endRow) {
		ArrayList<ReviewBoardDto> myReviews = new ArrayList<ReviewBoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT *" + 
				"        FROM(SELECT ROWNUM RN, A.* FROM(SELECT MV.mvTitle, rbContent, rbRdate FROM REVIEW_BOARD RB, MOVIE MV WHERE RB.mvId=MV.mvId AND mId=? ORDER BY rbRdate DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rbNum = rs.getInt("rbNum");
				String rbContent = rs.getString("rbContent");
				Date rbRdate = rs.getDate("rbRdate");
				String rbIp = rs.getString("rbIp");
				int mvId = rs.getInt("mvId");
				myReviews.add(new ReviewBoardDto(rbNum, rbContent, rbRdate, rbIp, mId, mvId));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return myReviews;
	}
	// (5)-1  자신이 작성한 댓글 갯수
	public int getMyReviewCnt(String mId) {
		int myReviewCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM REVIEW_BOARD WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			rs.next();
			myReviewCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return myReviewCnt;
	}
}
