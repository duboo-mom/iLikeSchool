package com.duboomom.iLikeSchool.school;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.iLikeSchool.school.bo.SchoolBO;
import com.duboomom.iLikeSchool.school.bo.SchoolNewsBO;
import com.duboomom.iLikeSchool.school.model.CalendarSchedule;
import com.duboomom.iLikeSchool.school.model.Schedule;
import com.duboomom.iLikeSchool.school.model.SchoolNews;
import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@RestController
@RequestMapping("/school")
public class SchoolRestController {

	@Autowired
	private SchoolBO schoolBO;
	
	@Autowired
	private SchoolNewsBO schoolNewsBO;
	
	@Autowired
	private UserBO userBO;
		
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
		
//		if(schoolName.isEmpty() || schoolName.length() == 0) {
//			return null;
//		} else {
//		}
//		
		return schoolNewsBO.requestNews(schoolName, 5);			
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
	
	// 동창회 게시글 작성
	@PostMapping("/create")
	public Map<String, String> createPost(
			@RequestParam("schoolId") int schoolId
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
				
		Map<String, String> result = new HashMap<>();
		
		int count = schoolBO.addPost(userId, schoolId, content, file);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 동창회 게시글 삭제
	@GetMapping("/delete")
	public Map<String, String> deletePost(
			@RequestParam("postId") int postId
			, HttpSession session) {

		int userId = (Integer)session.getAttribute("userId");
		
		int count = schoolBO.deletePost(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
//	// 친구 찾기 api
//	@GetMapping("/findfriend")
//	public Map<String, Object> findFriend(
//			@RequestParam("friendName") String friendName
//			, @RequestParam("friendSchool") String friendSchool) {
//		
//		List<Friend> friendList = schoolBO.getFriendList(friendName, friendSchool);
//		
//		Map<String, Object> result = new HashMap<>();
//		
//		if(friendList != null) {
//			result.put("result", "success");
//			result.put("friendList", friendList);
//		} else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//		
//			
//	}
//	
	
	// 학교 일정 조회
	@GetMapping("/getschedule")
	public List<CalendarSchedule> getScheduleBySchool(@RequestParam("schoolId") int schoolId) {
		
		List<Schedule> scheduleList = schoolBO.getSchedulebySchool(schoolId);
		
		List<CalendarSchedule> calendarList = new ArrayList<>();
		
		for(Schedule schedule:scheduleList) {
			
			String title = schedule.getTitle();
			Date start = schedule.getDateInfo();
			
			CalendarSchedule calendar = new CalendarSchedule();
			
			calendar.setTitle(title);
			calendar.setStart(start);
			
			calendarList.add(calendar);
		}
				
		return calendarList;
		
	}
	
	
}
