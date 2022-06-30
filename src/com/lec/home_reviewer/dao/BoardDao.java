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

public class BoardDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	private BoardDao() {}
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
	// (1) 글목록(startRow부터 endRow까지)
	public ArrayList<BoardDto> listBoard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM " + 
				"    (SELECT ROWNUM RN, A.* FROM " + 
				"        (SELECT * FROM BOARD ORDER BY bGroup DESC, bStep) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bNum = rs.getInt("bNum");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bRdate = rs.getDate("bRdate");
				int bHit = rs.getInt("bHit");;
				int bGroup = rs.getInt("bGroup");;
				int bStep = rs.getInt("bStep");;
				int bIndent = rs.getInt("bIndent");;
				String bIp = rs.getString("bIp");
				String mId = rs.getString("mId");
				dtos.add(new BoardDto(bNum, bTitle, bContent, bRdate, bHit, bGroup, bStep, bIndent, bIp, mId));
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
	// (2) 글갯수
	public int getBoardCnt() {
		int boardCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardCnt = rs.getInt(1);
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
		return boardCnt;
	}
	// (3) 글쓰기
	public int writeBoard(String mId, String bTitle, String bContent, String fIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)" + 
				"        VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, BOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, fIp);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "원글쓰기성공":"원글쓰기실패");
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
	// (4) bHit 하나 올리기
	private void hitUp(int bNum) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET bHit = bHit +1 WHERE bNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	// (5) bNum으로 BoardDto보기
	public BoardDto contentView(int bNum) {
		hitUp(bNum);
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD  WHERE bNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bRdate = rs.getDate("bRdate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");;
				int bStep = rs.getInt("bStep");;
				int bIndent = rs.getInt("bIndent");;
				String bIp = rs.getString("bIp");
				String mId = rs.getString("mId");
				dto = new BoardDto(bNum, bTitle, bContent, bRdate, bHit, bGroup, bStep, bIndent, bIp, mId);
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
	// (6) bNum으로 BoardDto보기 : 답변글 view + 수정 view (bNum으로 DTO리턴)
	public BoardDto modifyView_replyView(int bNum) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD  WHERE bNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Date bRdate = rs.getDate("bRdate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");;
				int bStep = rs.getInt("bStep");;
				int bIndent = rs.getInt("bIndent");;
				String bIp = rs.getString("bIp");
				String mId = rs.getString("mId");
				dto = new BoardDto(bNum, bTitle, bContent, bRdate, bHit, bGroup, bStep, bIndent, bIp, mId);
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
	// (7) 글 수정하기
	public int modifyBoard(int bNum, String bTitle, String bContent, String bIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET bTitle = ?," + 
				"                     bContent = ?," + 
				"                     bIp = ?," + 
				"                     bRdate = SYSDATE" + 
				"                WHERE bNum = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bIp);
			pstmt.setInt(4, bNum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글수정성공":"글수정실패");
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
	// (8) 글 삭제하기
	public int deleteBoard(int bNum) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE bNum = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글삭제성공":"글삭제실패");
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
	// (9) 답변글 추가전 STEP a 수행
	private void preReplyStepA(int bGroup, int bStep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET bStep = bStep+1  WHERE bGroup = ? AND bStep>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bGroup);
			pstmt.setInt(2, bStep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	// (10) 답변글 쓰기 
	public int replyBoard(String mId, String bTitle, String bContent, int bGroup, int bStep, int bIndent, String bIp) {
		preReplyStepA(bGroup, bStep);
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)" + 
				"        VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, bGroup);
			pstmt.setInt(5, bStep + 1);
			pstmt.setInt(6, bIndent + 1);
			pstmt.setString(7, bIp);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변쓰기성공":"답변쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}
