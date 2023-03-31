package com.duboomom.iLikeSchool.school.gathering.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.gathering.dao.GatheringDAO;
import com.duboomom.iLikeSchool.school.gathering.model.Gathering;

@Service
public class GatheringBO {

	@Autowired
	private GatheringDAO gatheringDAO;
	
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
	
}
