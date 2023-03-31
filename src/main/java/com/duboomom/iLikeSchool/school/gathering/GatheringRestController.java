package com.duboomom.iLikeSchool.school.gathering;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.duboomom.iLikeSchool.school.gathering.bo.GatheringBO;

@RestController
@RequestMapping("/school/gathering")
public class GatheringRestController {

	@Autowired
	private GatheringBO gatheringBO;
	
	@GetMapping("/create")
	public Map<String, String> addNewGathering(
			@RequestParam("schoolId") int schoolId
			, @RequestParam("title") String title
			, @RequestParam("detail") String detail
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = gatheringBO.addNewGathering(userId, schoolId, title, detail);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 소모임 가입
	@GetMapping("/join")
	public Map<String, String> joinGathering(@RequestParam("gatheringId") int gatheringId, HttpSession session) {
	
		int userId = (Integer)session.getAttribute("userId");
		int count = gatheringBO.joinGathering(userId, gatheringId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 소모임 가입여부
	@GetMapping("/isMember")
	public Map<String, Boolean> isGatheringMember(@RequestParam("gatheringId") int gatheringId, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		Boolean isMember = gatheringBO.isGatheringMember(userId, gatheringId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", isMember);
		
		return result;
	}
	
	// 소모임 comment 추가
	@GetMapping("/comment/add")
	public Map<String, String> addComment(
			@RequestParam("gatheringId") int gatheringId
			, @RequestParam("comment") String comment
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = gatheringBO.addGatheringComment(gatheringId, userId, comment);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 방장만 소모임 공지사항 수정 기능
	@GetMapping("/annonce")
	public Map<String, String> editAnnounce(
			@RequestParam("gatheringId") int gatheringId
			, @RequestParam("announce") String announce
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = gatheringBO.editAnnouncement(gatheringId, userId, announce);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	
}
