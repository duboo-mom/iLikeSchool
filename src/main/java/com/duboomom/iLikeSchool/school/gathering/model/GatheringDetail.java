package com.duboomom.iLikeSchool.school.gathering.model;

import java.util.List;

public class GatheringDetail {

	private int gatheringId;
	private int userId;
	private int schoolId;
	private String masterName;
	private String title;
	private String detail;
	private String announcement;
	private List<CommentDetail> commentList;
		
	public int getGatheringId() {
		return gatheringId;
	}
	public void setGatheringId(int gatheringId) {
		this.gatheringId = gatheringId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	public String getMasterName() {
		return masterName;
	}
	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}
	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}

	
	
	
}
