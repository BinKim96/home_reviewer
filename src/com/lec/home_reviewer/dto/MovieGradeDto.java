package com.lec.home_reviewer.dto;

public class MovieGradeDto {
	private int grId;
	private String grName;
	public MovieGradeDto() {}
	public MovieGradeDto(int grId, String grName) {
		this.grId = grId;
		this.grName = grName;
	}
	public int getGrId() {
		return grId;
	}
	public void setGrId(int grId) {
		this.grId = grId;
	}
	public String getGrName() {
		return grName;
	}
	public void setGrName(String grName) {
		this.grName = grName;
	}
	@Override
	public String toString() {
		return "MovieGradeDto [grId=" + grId + ", grName=" + grName + "]";
	}
}
