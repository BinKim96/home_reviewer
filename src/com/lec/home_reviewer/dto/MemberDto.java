package com.lec.home_reviewer.dto;

import java.sql.Date;

public class MemberDto {
	private String mId;
	private String mPw;
	private String mName;
	private String mEmail;
	private String mPhoto;
	private String mGender;
	private Date mRdate;
	private int mReviewCnt;
	
	public MemberDto() {}
	public MemberDto(String mId, String mPw, String mName, String mEmail, String mPhoto, String mGender, Date mRdate,
			int mReviewCnt) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPhoto = mPhoto;
		this.mGender = mGender;
		this.mRdate = mRdate;
		this.mReviewCnt = mReviewCnt;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	
	public String getmName() {
		return mName;
	}
	
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public Date getmRdate() {
		return mRdate;
	}

	public void setmRdate(Date mRdate) {
		this.mRdate = mRdate;
	}

	public int getmReviewCnt() {
		return mReviewCnt;
	}

	public void setmReviewCnt(int mReviewCnt) {
		this.mReviewCnt = mReviewCnt;
	}
	@Override
	public String toString() {
		return "MemberDto [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mEmail=" + mEmail + ", mPhoto="
				+ mPhoto + ", mGender=" + mGender + ", mRdate=" + mRdate + ", mReviewCnt=" + mReviewCnt + "]";
	}
}
