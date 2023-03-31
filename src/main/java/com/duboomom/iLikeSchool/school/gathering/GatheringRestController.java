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
	
	
}
