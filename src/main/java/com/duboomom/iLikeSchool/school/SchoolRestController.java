package com.duboomom.iLikeSchool.school;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.duboomom.iLikeSchool.school.bo.SchoolBO;

@RestController
public class SchoolRestController {

	@Autowired
	private SchoolBO schoolBO;
		
	// 학교 정보 추가 api
	@GetMapping("/signup/school")
	public Map<String, String> signupSchoolInfo(
			@RequestParam("elementary") String elementary
			, @RequestParam("middelschool") String middleschool
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
	
}
