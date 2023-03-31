package com.duboomom.iLikeSchool.school.gathering.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.gathering.dao.GatheringDAO;

@Service
public class GatheringBO {

	@Autowired
	private GatheringDAO gatheringDAO;
	
	public int addNewGathering(int userId, int schoolId, String title, String detail) {
		return gatheringDAO.insertGathering(userId, schoolId, title, detail);
	}
	
}
