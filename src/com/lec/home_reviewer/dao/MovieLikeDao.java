package com.lec.home_reviewer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MovieLikeDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0; 
	public static final int LIKE_CHECK =1;
	public static final int LIKE_UNCHECK =0;
	// 싱글톤
	private static MovieLikeDao instance = new MovieLikeDao();
	public static MovieLikeDao getInstance() {
		return instance;
	}
	private MovieLikeDao() {}
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
	// (1) 해당 영화 좋아요 누르기(사용자)
	public int insertLike(String mId, int mvId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "좋아요누르기성공":"좋아요누르기실패");
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
	// (2) 해당 영화 좋아요 취소(사용자)
	public int deleteLike(String mId, int mvId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MOVIE_LIKE WHERE mId=? AND mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "좋아요취소성공":"좋아요취소실패");
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
	
	// (3) 해당영화 좋아요 눌렀는지 안눌렀는지 여부
	public int checkLike(String mId, int mvId) {
		int result = LIKE_UNCHECK;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MOVIE_LIKE WHERE mId=? AND mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, mvId);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
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
		return result;
	}
}
