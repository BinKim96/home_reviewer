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
import com.lec.home_reviewer.dto.MovieGenreDto;
import com.lec.home_reviewer.dto.MovieGradeDto;

public class MovieDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0; 
	// 싱글톤
	private static MovieDao instance = new MovieDao();
	public static MovieDao getInstance() {
		return instance;
	}
	private MovieDao() {}
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
	// (1) 영화등록(관리자용)
	public int adminRegisterMovie(MovieDto movie) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent)" + 
				" VALUES(MOVIE_SEQ.NEXTVAL , ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie.getMvTitle());
			pstmt.setInt(2, movie.getgId());
			pstmt.setDate(3, movie.getMvReleaseDate());
			pstmt.setString(4, movie.getMvDirector());
			pstmt.setString(5, movie.getMvCast());
			pstmt.setString(6, movie.getMvRunningTime());
			pstmt.setInt(7, movie.getGrId());
			pstmt.setString(8, movie.getMvPoster());
			pstmt.setString(9, movie.getMvContent());
			result = pstmt.executeUpdate();
			System.out.println("영화등록성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"SQL문 오류임"+movie);
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
	// (2)-1  영화목록(관리자용) -> 페이징 필요
	public ArrayList<MovieDto> listMoive(int startRow, int endRow){
		ArrayList<MovieDto> movies = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "SELECT *" + 
				"        FROM (SELECT ROWNUM RN, MVID, MVTITLE, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, MVPOSTER, NVL((SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId), 0) mlCnt FROM MOVIE M ORDER BY MVRELEASEDATE DESC)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mvId = rs.getInt("mvId");
				String mvTitle = rs.getString("mvtitle");
				String mvReleaseYear = rs.getString("mvReleaseYear");
				String mvPoster = rs.getString("mvPoster");
				int mlCnt = rs.getInt("mlCnt");
				movies.add(new MovieDto(mvId, mvTitle, mvReleaseYear, mvPoster, mlCnt));
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
		return movies;
	}
	// (2)-2 개봉일 최신순 (탑3) -> 
	public ArrayList<MovieDto> listLastMovie() {
		ArrayList<MovieDto> lastMovies = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT *" + 
				"        FROM (SELECT MVID, MVTITLE, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, MVPOSTER, NVL((SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId), 0) mlCnt FROM MOVIE M ORDER BY MVRELEASEDATE DESC)" + 
				"        WHERE ROWNUM<4";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mvId = rs.getInt("mvId");
				String mvTitle = rs.getString("mvtitle");
				String mvReleaseYear = rs.getString("mvReleaseYear");
				String mvPoster = rs.getString("mvPoster");
				int mlCnt = rs.getInt("mlCnt");
				lastMovies.add(new MovieDto(mvId ,mvTitle, mvReleaseYear, mvPoster, mlCnt));
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
		return lastMovies;
	}
	// (2)-3 좋아요 많은순(탑3)
	public ArrayList<MovieDto> listPopularMovie() {
		ArrayList<MovieDto> popularMovies = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT *" + 
				"        FROM (SELECT mvId, MVTITLE, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, MVPOSTER, NVL((SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId),0) mlCnt FROM MOVIE M ORDER BY MLCNT DESC, MVRELEASEDATE DESC)" + 
				"        WHERE ROWNUM<4";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mvId = rs.getInt("mvId");
				String mvTitle = rs.getString("mvtitle");
				String mvReleaseYear = rs.getString("mvReleaseYear");
				String mvPoster = rs.getString("mvPoster");
				int mlCnt = rs.getInt("mlCnt");
				popularMovies.add(new MovieDto(mvId, mvTitle, mvReleaseYear, mvPoster, mlCnt));
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
		return popularMovies;
	}
	// (3) 영화검색(공용)
	public ArrayList<MovieDto> searchMoive(String schmvTitle, int startRow, int endRow){
		ArrayList<MovieDto> searchedMovies = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "SELECT *" + 
				"        FROM(SELECT ROWNUM RN, A.* FROM(SELECT M.mvId, M.mvTitle, M.mvPoster, TO_CHAR(M.mvReleaseDate, 'YYYY') mvReleaseYear, NVL((SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId),0) mlCnt FROM MOVIE M WHERE mvTitle LIKE '%'||?||'%' ORDER BY mvReleaseDate DESC) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schmvTitle);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mvId = rs.getInt("mvId");
				String mvTitle = rs.getString("mvTitle");
				String mvReleaseYear = rs.getString("mvReleaseYear");
				String mvPoster = rs.getString("mvPoster");
				int mlCnt = rs.getInt("mlCnt");
				searchedMovies.add(new MovieDto(mvId, mvTitle, mvReleaseYear, mvPoster, mlCnt));
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
		return searchedMovies;
	}
	// (3)-1 검색된 영화 갯수
	public int getSearchedMovieCnt(String schmvTitle) {
		int searchedMovieCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM MOVIE WHERE mvTitle LIKE '%'||?||'%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schmvTitle);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				searchedMovieCnt = rs.getInt(1);
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
		return searchedMovieCnt;
	}
	// (4) 영화상세보기(공용) => mvId로 MovieDto가져오기
	public MovieDto getMovie(int mvId) {
		MovieDto movie = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "SELECT mvTitle, gName, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grName, mvPoster, mvContent,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt" + 
				"        FROM MOVIE M, GENRE G, GRADE GR" + 
				"        WHERE M.gId=G.gId AND M.grId=GR.grId AND mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mvTitle = rs.getString("mvtitle");
				String gName = rs.getString("gName");
				String mvReleaseYear = rs.getString("mvReleaseYear");
				Date mvReleaseDate = rs.getDate("mvReleaseDate");
				String mvDirector = rs.getString("mvDirector");
				String mvCast = rs.getString("mvCast");
				String mvRunningTime = rs.getString("mvRunningTime");
				String grName = rs.getString("grName");
				String mvPoster = rs.getString("mvPoster");
				String mvContent = rs.getString("mvContent");
				int mlCnt = rs.getInt("mlCnt");
				movie = new MovieDto(mvId, mvTitle, gName, mvReleaseYear, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grName, mvPoster, mvContent, mlCnt);
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
		return movie;
	}
	// (5) 영화수정(관리자용)
	public int modifyMovie(int mvId, String mvTitle, int gId, Date mvReleaseDate, String mvDirector, String mvCast, String mvRunningTime, int grId, String mvPoster, String mvContent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql= "UPDATE MOVIE SET mvTitle=?," + 
				"                     gId=?," + 
				"                     mvReleaseDate=?," + 
				"                     mvDirector=?," + 
				"                     mvCast=?," + 
				"                     mvRunningTime=?," + 
				"                     grId=?," + 
				"                     mvPoster=?," + 
				"                     mvContent=?" + 
				"                WHERE mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvTitle);
			pstmt.setInt(2, gId);
			pstmt.setDate(3, mvReleaseDate);
			pstmt.setString(4, mvDirector);
			pstmt.setString(5, mvCast);
			pstmt.setString(6, mvRunningTime);
			pstmt.setInt(7, grId);
			pstmt.setString(8, mvPoster);
			pstmt.setString(9, mvContent);
			pstmt.setInt(10, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화정보수정성공":"영화정보수정실패");
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
	// (6) 영화삭제(관리자용)
	public int deleteMovie(int mvId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MOVIE WHERE mvId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화삭제성공":"영화삭제실패");
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
	// (7) 영화 갯수
	public int getMovieCnt() {
		int movieCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM MOVIE";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				movieCnt = rs.getInt(1);
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
		return movieCnt;
	}
	// (8) 영화 등급 가져오기
	public ArrayList<MovieGradeDto> getGrade (){
		ArrayList<MovieGradeDto> movieGrades = new ArrayList<MovieGradeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM GRADE";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int grId = rs.getInt("grId");
				String grName = rs.getString("grName");
				movieGrades.add(new MovieGradeDto(grId, grName));
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
		return movieGrades;
	}
	// (8) 영화 장르 가져오기
		public ArrayList<MovieGenreDto> getGenre (){
			ArrayList<MovieGenreDto> movieGenres = new ArrayList<MovieGenreDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM GENRE";
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int gId = rs.getInt("gId");
					String gName = rs.getString("gName");
					movieGenres.add(new MovieGenreDto(gId, gName));
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
			return movieGenres;
		}
}
