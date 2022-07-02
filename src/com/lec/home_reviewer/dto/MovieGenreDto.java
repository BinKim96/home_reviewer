package com.lec.home_reviewer.dto;

public class MovieGenreDto {
	private int gId;
	private String gName;
	public MovieGenreDto() {}
	public MovieGenreDto(int gId, String gName) {
		this.gId = gId;
		this.gName = gName;
	}
	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	@Override
	public String toString() {
		return "MovieGenreDto [gId=" + gId + ", gName=" + gName + "]";
	}
}
