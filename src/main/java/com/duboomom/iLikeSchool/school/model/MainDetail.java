package com.duboomom.iLikeSchool.school.model;

import java.util.List;

public class MainDetail {

	private List<SchoolMember> schoolMemberList;
	private List<PostDetail> PostDetailList;
	private List<SchoolNews> schoolNewsList;
	
	
	public List<SchoolMember> getSchoolMemberList() {
		return schoolMemberList;
	}
	public void setSchoolMemberList(List<SchoolMember> schoolMemberList) {
		this.schoolMemberList = schoolMemberList;
	}
	public List<PostDetail> getPostDetailList() {
		return PostDetailList;
	}
	public void setPostDetailList(List<PostDetail> postDetailList) {
		PostDetailList = postDetailList;
	}
	public List<SchoolNews> getSchoolNewsList() {
		return schoolNewsList;
	}
	public void setSchoolNewsList(List<SchoolNews> schoolNewsList) {
		this.schoolNewsList = schoolNewsList;
	}
	
	
	

	
	
	
}
