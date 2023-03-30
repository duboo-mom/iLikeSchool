package com.duboomom.iLikeSchool.school.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.dao.SchoolDAO;
import com.duboomom.iLikeSchool.school.model.School;

@Service
public class SchoolBO {
	
	@Autowired
	private SchoolDAO schoolDAO;

	public int addSchool(
			String elementary
			, String middleschool
			, String highschool
			, String university) {
		
		int count = 0;
		
		// 학교정보가 null이 아닌 값을 insert school도 해야함..!
		// school DB 조회해서 없으면 추가해야함..!!!!!
		// userSchool에도 등록

		if(elementary != null) {
			if(schoolDAO.selectCountSchool(elementary) == 0) {
				schoolDAO.insertSchool(elementary, "초");
				count++;
			}			
		}
		
		if(middleschool != null) {
			if(schoolDAO.selectCountSchool(middleschool) == 0) {
				schoolDAO.insertSchool(middleschool, "중");
				count++;
			}
		}

		if(highschool != null) {			
			if(schoolDAO.selectCountSchool(highschool) == 0) {
				schoolDAO.insertSchool(highschool, "고");
				count++;
			}
		}
		
		if(university != null) {
			if(schoolDAO.selectCountSchool(university) == 0) {
				schoolDAO.insertSchool(university, "대");
				count++;
			}
		}
		
		return count;
		
	}
	
	public School getSchoolbyName(String schoolName) {
		return schoolDAO.selectSchoolByName(schoolName);
	}
	
	public List<School> getSchoolById(List<Integer> idList) {
		return schoolDAO.selectSchoolById(idList);
	}
	
	public int addSchedule(int userId, int schoolId, String title, String locationInfo, Date dateInfo, String detail) {
		
		return schoolDAO.insertSchedule(userId, schoolId, title, locationInfo, dateInfo, detail);		
	}
	
	public int addElementary(String elementary) {
		return schoolDAO.insertSchool(elementary, "초");
	}
	
	public int addMiddleschool(String middleschool) {
		return schoolDAO.insertSchool(middleschool, "중");
	}
	
	public int addHighschool(String highschool) {
		return schoolDAO.insertSchool(highschool, "고");
	}
	
	public int addUniversity(String university) {
		return schoolDAO.insertSchool(university, "대");
	}
	
	
}
