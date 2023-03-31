package com.duboomom.iLikeSchool.school.gathering.model;

import java.util.Date;

public class GatheringComment {

	private int id;
	private int gatheringId;
	private int userId;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
		
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
}
