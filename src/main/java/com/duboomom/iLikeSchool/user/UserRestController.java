package com.duboomom.iLikeSchool.user;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@PostMapping("/signup/user")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("nickname") String nickname
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("birthday") String birthday
			, @RequestParam("gender") String gender) {
		
		
	}
	
	public Map<String, String> signupSchoolInfo(
			@RequestParam("elementary") String elementary
			, @RequestParam("middelschool") String middleschool
			, @RequestParam("highschool") String highschool
			, @RequestParam("university") String university) {
		
	}
	
	public Map<String, String> signupUserSchool() {
		
	}
	
}
