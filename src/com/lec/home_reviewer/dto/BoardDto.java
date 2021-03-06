package com.lec.home_reviewer.dto;

import java.sql.Date;

public class BoardDto {
	private int bNum;
	private String bTitle;
	private String bContent;
	private Date bRdate;
	private int bHit;
	private int bGroup;
	private int bStep;
	private int bIndent;
	private String bIp;
	private String mId;

	public BoardDto() {}
	public BoardDto(int bNum, String bTitle, String bContent, Date bRdate, int bHit, int bGroup, int bStep, int bIndent,
			String bIp, String mId) {
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRdate = bRdate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.bIp = bIp;
		this.mId = mId;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbRdate() {
		return bRdate;
	}
	public void setbRdate(Date bRdate) {
		this.bRdate = bRdate;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public String getbIp() {
		return bIp;
	}
	public void setbIp(String bIp) {
		this.bIp = bIp;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	@Override
	public String toString() {
		return "BoardDto [bNum=" + bNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bRdate=" + bRdate
				+ ", bHit=" + bHit + ", bGroup=" + bGroup + ", bStep=" + bStep + ", bIndent=" + bIndent + ", bIp=" + bIp
				+ ", mId=" + mId + "]";
	}
}
