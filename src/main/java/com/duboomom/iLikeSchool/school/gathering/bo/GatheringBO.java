package com.duboomom.iLikeSchool.school.gathering.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.gathering.dao.GatheringDAO;
import com.duboomom.iLikeSchool.school.gathering.model.CommentDetail;
import com.duboomom.iLikeSchool.school.gathering.model.Gathering;
import com.duboomom.iLikeSchool.school.gathering.model.GatheringComment;
import com.duboomom.iLikeSchool.school.gathering.model.GatheringDetail;
import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.User;

@Service
public class GatheringBO {

	@Autowired
	private GatheringDAO gatheringDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addNewGathering(int userId, int schoolId, String title, String detail) {
		return gatheringDAO.insertGathering(userId, schoolId, title, detail);
	}
	
	public List<Gathering> getGatherings(int schoolId) {
		return gatheringDAO.selectGathering(schoolId);
	}
	
	public int joinGathering(int userId, int gatheringId) {
		return gatheringDAO.insertGatheringMember(userId, gatheringId);
	}

	public Boolean isGatheringMember(int userId, int gatheringId) {
		
		int count = gatheringDAO.selectMemberCount(userId, gatheringId);
		
		if(count == 1) {
			return true;
		} else {
			return false;
		}
	}

	public int addGatheringComment(int gatheringId, int userId, String comment) {
		return gatheringDAO.insertGatheringComment(userId, gatheringId, comment);
	}
	
	public int editAnnouncement(int gatheringId, int userId, String announce) {
		return gatheringDAO.updateGatheringAnnouncement(userId, gatheringId, announce);
	}
	
	public GatheringDetail getGatheringDetail(int gatheringId) {
		
		Gathering gathering =  gatheringDAO.selectGatheringById(gatheringId);
		
		GatheringDetail gatheringDetail = new GatheringDetail();
		
		gatheringDetail.setGatheringId(gatheringId);
		gatheringDetail.setUserId(gathering.getUserId());
		gatheringDetail.setSchoolId(gathering.getSchoolId());
		
		// 방장 이름
		User masterUser = userBO.getUserById(gathering.getUserId());		
		gatheringDetail.setMasterName(masterUser.getName()); 
				
		gatheringDetail.setTitle(gathering.getTitle());
		gatheringDetail.setDetail(gathering.getDetail());
		gatheringDetail.setAnnouncement(gathering.getAnnouncement());
		
		List<GatheringComment> GatheringCommentList = gatheringDAO.selectCommentByGatheringId(gatheringId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();		
		
		for(GatheringComment comment : GatheringCommentList) {
			CommentDetail commentDetail = new CommentDetail(); 

			int userId = comment.getUserId();
			User user = userBO.getUserById(userId);
			String userNick = user.getNickname();
			
			String commentContent = comment.getComment();
			
			commentDetail.setUserNickname(userNick);
			commentDetail.setComment(commentContent);
			
			commentDetailList.add(commentDetail);
		}
		
		gatheringDetail.setCommentList(commentDetailList);
		
		return gatheringDetail;
	}
	
	public int getGatheringUserId(int gatheringId) {
		Gathering gathering = gatheringDAO.selectGatheringById(gatheringId);
		return gathering.getUserId();
	}
	
	public int leaveGathering(int gatheringId, int userId) {
		return gatheringDAO.deleteGatheringMember(gatheringId, userId);
	}
	
	
}
