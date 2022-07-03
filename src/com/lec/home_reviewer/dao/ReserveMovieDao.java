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

import com.lec.home_reviewer.dto.MovieDto;
import com.lec.home_reviewer.dto.ReserveMovieDto;

public class ReserveMovieDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0;
	public static final int RESERVE_CHECK =1;
	public static final int RESERVE_UNCHECK =0;
	// 싱글톤
	private static ReserveMovieDao instance = new ReserveMovieDao();
	public static ReserveMovieDao getInstance() {
		return instance;
	}
	private ReserveMovieDao() {}
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
	// (1) 해당 영화 찜하기 누르기(사용자)
	public int insertReserve(String mId, int mvId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화찜성공":"영화찜실패");
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
	// (2) 해당 영화 찜 취소(사용자)
	public int deleteReserve(String mId, int mvId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM RESERVE_MOVIE WHERE mId=? AND mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화찜해제성공":"영화찜해제실패");
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
	// (3) 해당영화 찜 눌렀는지 안눌렀는지 여부
	public int checkReserve(String mId, int mvId) {
		int result = RESERVE_UNCHECK;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM RESERVE_MOVIE WHERE mId=? AND mvId=?";
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
	// (4) 찜한영화목록
	public ArrayList<ReserveMovieDto> listReservedMovie(String mId, int startRow, int endRow) {
		ArrayList<ReserveMovieDto> reservedMovies = new ArrayList<ReserveMovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT *" + 
				"        FROM(SELECT ROWNUM RN, A.* FROM(SELECT MV.mvTitle, MV.mvPoster, TO_CHAR(MV.mvReleaseDate, 'YYYY') mvReleaseYear FROM RESERVE_MOVIE RM, MOVIE MV WHERE RM.mvId=MV.mvId AND mId=? ORDER BY rmRdate DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rmId = rs.getInt("rmId");
				Date rmRdate = rs.getDate("mvRdate");
				int mvId = rs.getInt("mvId");
				reservedMovies.add(new ReserveMovieDto(rmId, rmRdate, mId, mvId));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"SQL문 오류임");
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
		return reservedMovies;
	}
	
	// (5) 찜한영화갯수
	public int getReservedMovieCnt(String mId) {
		int reservedMovieCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM RESERVE_MOVIE WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			rs.next();
			reservedMovieCnt = rs.getInt(1);
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
		return reservedMovieCnt;
	}
}
