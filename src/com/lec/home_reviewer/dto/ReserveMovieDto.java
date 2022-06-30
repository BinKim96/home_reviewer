package com.lec.home_reviewer.dto;

import java.sql.Date;

public class ReserveMovieDto {
	private int rmId;
	private Date rmRdate;
	private String mId;
	private int mvId;
	
	public ReserveMovieDto() {}
	public ReserveMovieDto(int rmId, Date rmRdate, String mId, int mvId) {
		this.rmId = rmId;
		this.rmRdate = rmRdate;
		this.mId = mId;
		this.mvId = mvId;
	}
	public int getRmId() {
		return rmId;
	}
	public void setRmId(int rmId) {
		this.rmId = rmId;
	}
	public Date getRmRdate() {
		return rmRdate;
	}
	public void setRmRdate(Date rmRdate) {
		this.rmRdate = rmRdate;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getMvId() {
		return mvId;
	}
	public void setMvId(int mvId) {
		this.mvId = mvId;
	}
	@Override
	public String toString() {
		return "ReserveMovieDto [rmId=" + rmId + ", rmRdate=" + rmRdate + ", mId=" + mId + ", mvId=" + mvId + "]";
	}
}
