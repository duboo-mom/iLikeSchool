package com.duboomom.iLikeSchool.school;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.duboomom.iLikeSchool.school.bo.SchoolBO;
import com.duboomom.iLikeSchool.school.bo.SchoolNewsBO;
import com.duboomom.iLikeSchool.school.model.SchoolNews;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@RestController
@RequestMapping("/school")
public class SchoolRestController {

	@Autowired
	private SchoolBO schoolBO;
	
	@Autowired
	private SchoolNewsBO schoolNewsBO;
		
	// 학교 정보 추가 api
	@GetMapping("/add")
	public Map<String, String> signupSchoolInfo(
			@RequestParam("elementary") String elementary
			, @RequestParam("middleschool") String middleschool
			, @RequestParam("highschool") String highschool
			, @RequestParam("university") String university) {
		
		// 학교정보 받아서 
		int count = schoolBO.addSchool(elementary, middleschool, highschool, university);
		
		Map<String, String> result = new HashMap<>();
		
		if(count != 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/news")
	public List<SchoolNews> getSchoolNews(@RequestParam(value = "schoolName", required = false) String schoolName) throws JsonMappingException, JsonProcessingException {
		
		if(schoolName.isEmpty()) {
			return null;
		} else {
			return schoolNewsBO.requestNews(schoolName);			
		}
		
	}
	
	@GetMapping("/schedule/create")
	public Map<String, String> scheduleInput(
			@RequestParam("schoolId") int schoolId
			, @RequestParam("title") String title
			, @RequestParam("locationInfo") String locationInfo
			, @RequestParam("dateInfo") Date dateInfo
			, @RequestParam(value = "detail", required = false) String detail
			, HttpSession session) throws ParseException {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = schoolBO.addSchedule(userId, schoolId, title, locationInfo, dateInfo, detail);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}
