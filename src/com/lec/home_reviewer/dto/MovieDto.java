package com.lec.home_reviewer.dto;

import java.sql.Date;

public class MovieDto {
	private int mvId;
	private String mvTitle;
	private int gId;
	private String gName;
	private String mvReleaseYear;
	private Date mvReleaseDate;
	private String mvDirector;
	private String mvCast;
	private String mvRunningTime;
	private int grId;
	private String grName;
	private String mvPoster;
	private String mvContent;
	private Date mvRdate;
	private int mlCnt;
	
	public MovieDto() {}
	
	public MovieDto(int mvId, String mvTitle, String mvReleaseYear, String mvPoster) { // 관리자 영화목록
		super();
		this.mvId = mvId;
		this.mvTitle = mvTitle;
		this.mvReleaseYear = mvReleaseYear;
		this.mvPoster = mvPoster;
	}

	public MovieDto(int mvId, String mvTitle, Date mvReleaseDate, String mvPoster, int mlCnt) { // 메인리스트
		this.mvId = mvId;
		this.mvTitle = mvTitle;
		this.mvReleaseDate = mvReleaseDate;
		this.mvPoster = mvPoster;
		this.mlCnt = mlCnt;
	}
	
	public MovieDto(int mvId, String mvTitle, String gName, String mvReleaseYear, Date mvReleaseDate, String mvDirector,
			String mvCast, String mvRunningTime, String grName, String mvPoster, String mvContent, int mlCnt) { // 영화상세보기
		this.mvId = mvId;
		this.mvTitle = mvTitle;
		this.gName = gName;
		this.mvReleaseYear = mvReleaseYear;
		this.mvReleaseDate = mvReleaseDate;
		this.mvDirector = mvDirector;
		this.mvCast = mvCast;
		this.mvRunningTime = mvRunningTime;
		this.grName = grName;
		this.mvPoster = mvPoster;
		this.mvContent = mvContent;
		this.mlCnt = mlCnt;
	}
	
	public MovieDto(int mvId, String mvTitle, int gId, String gName, String mvReleaseYear, Date mvReleaseDate,
			String mvDirector, String mvCast, String mvRunningTime, int grId, String grName, String mvPoster,
			String mvContent, Date mvRdate, int mlCnt) { // 관리자용
		this.mvId = mvId;
		this.mvTitle = mvTitle;
		this.gId = gId;
		this.gName = gName;
		this.mvReleaseYear = mvReleaseYear;
		this.mvReleaseDate = mvReleaseDate;
		this.mvDirector = mvDirector;
		this.mvCast = mvCast;
		this.mvRunningTime = mvRunningTime;
		this.grId = grId;
		this.grName = grName;
		this.mvPoster = mvPoster;
		this.mvContent = mvContent;
		this.mvRdate = mvRdate;
		this.mlCnt = mlCnt;
	}
	public int getMvId() {
		return mvId;
	}
	public void setMvId(int mvId) {
		this.mvId = mvId;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}
	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public Date getMvReleaseDate() {
		return mvReleaseDate;
	}
	public void setMvReleaseDate(Date mvReleaseDate) {
		this.mvReleaseDate = mvReleaseDate;
	}
	public String getMvDirector() {
		return mvDirector;
	}
	public void setMvDirector(String mvDirector) {
		this.mvDirector = mvDirector;
	}
	public String getMvCast() {
		return mvCast;
	}
	public void setMvCast(String mvCast) {
		this.mvCast = mvCast;
	}
	public String getMvRunningTime() {
		return mvRunningTime;
	}
	public void setMvRunningTime(String mvRunningTime) {
		this.mvRunningTime = mvRunningTime;
	}
	public int getGrId() {
		return grId;
	}
	public void setGrId(int grId) {
		this.grId = grId;
	}
	public String getMvPoster() {
		return mvPoster;
	}
	public void setMvPoster(String mvPoster) {
		this.mvPoster = mvPoster;
	}
	public String getMvContent() {
		return mvContent;
	}
	public void setMvContent(String mvContent) {
		this.mvContent = mvContent;
	}
	public Date getMvRdate() {
		return mvRdate;
	}
	public void setMvRdate(Date mvRdate) {
		this.mvRdate = mvRdate;
	}
	public int getMlCnt() {
		return mlCnt;
	}
	public void setMlCnt(int mlCnt) {
		this.mlCnt = mlCnt;
	}
	public String getMvReleaseYear() {
		return mvReleaseYear;
	}
	public void setMvReleaseYear(String mvReleaseYear) {
		this.mvReleaseYear = mvReleaseYear;
	}
	public String getGrName() {
		return grName;
	}
	public void setGrName(String grName) {
		this.grName = grName;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	@Override
	public String toString() {
		return "MovieDto [mvId=" + mvId + ", mvTitle=" + mvTitle + ", gId=" + gId + ", mvReleaseDate=" + mvReleaseDate
				+ ", mvDirector=" + mvDirector + ", mvCast=" + mvCast + ", mvRunningTime=" + mvRunningTime + ", grId="
				+ grId + ", mvPoster=" + mvPoster + ", mvContent=" + mvContent + ", mvRdate=" + mvRdate + "]";
	}
}
