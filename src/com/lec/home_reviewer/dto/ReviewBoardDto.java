package com.lec.home_reviewer.dto;

import java.sql.Date;

public class ReviewBoardDto {
	private int rbNum;
	private String rbContent;
	private Date rbRdate;
	private String rbIp;
	private String mId;
	private int mvId;
	
	public ReviewBoardDto() {}
	
	public ReviewBoardDto(String rbContent, Date rbRdate, String rbIp, String mId, int mvId) {
		this.rbContent = rbContent;
		this.rbRdate = rbRdate;
		this.rbIp = rbIp;
		this.mId = mId;
		this.mvId = mvId;
	}

	public ReviewBoardDto(int rbNum, String rbContent, Date rbRdate, String rbIp, String mId, int mvId) {
		this.rbNum = rbNum;
		this.rbContent = rbContent;
		this.rbRdate = rbRdate;
		this.rbIp = rbIp;
		this.mId = mId;
		this.mvId = mvId;
	}
	public int getRbNum() {
		return rbNum;
	}
	public void setRbNum(int rbNum) {
		this.rbNum = rbNum;
	}
	public String getRbContent() {
		return rbContent;
	}
	public void setRbContent(String rbContent) {
		this.rbContent = rbContent;
	}
	public Date getRbRdate() {
		return rbRdate;
	}
	public void setRbRdate(Date rbRdate) {
		this.rbRdate = rbRdate;
	}
	public String getRbIp() {
		return rbIp;
	}
	public void setRbIp(String rbIp) {
		this.rbIp = rbIp;
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
		return "ReviewBoardDto [rbNum=" + rbNum + ", rbContent=" + rbContent + ", rbRdate=" + rbRdate + ", rbIp=" + rbIp
				+ ", mId=" + mId + ", mvId=" + mvId + "]";
	}
}
