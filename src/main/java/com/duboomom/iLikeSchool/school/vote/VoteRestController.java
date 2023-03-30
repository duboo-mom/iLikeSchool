package com.duboomom.iLikeSchool.school.vote;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duboomom.iLikeSchool.school.vote.bo.VoteBO;

@Controller
@RequestMapping("/school/vote")
public class VoteRestController {
	
	@Autowired
	private VoteBO voteBO;

	@GetMapping("/create")
	public Map<String, String> addVote(
			@RequestParam("schoolId") int schoolId
			, @RequestParam("title") String title
			, @RequestParam("endDate") Date endDate
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = voteBO.addVote(schoolId, userId, title, endDate);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/item/create")
	public Map<String, String> addVoteItem(
			@RequestParam("schoolId") int schoolId
			, @RequestParam("title") String title
			, @RequestParam(value="item1", required=false) String item1
			, @RequestParam(value="item2", required=false) String item2
			, @RequestParam(value="item3", required=false) String item3
			, @RequestParam(value="item4", required=false) String item4
			, @RequestParam(value="item5", required=false) String item5
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = voteBO.addVoteItems(schoolId, userId, title, item1, item2, item3, item4, item5);
				
		Map<String, String> result = new HashMap<>();
		
		if(count != 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
}
