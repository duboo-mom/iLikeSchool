package com.duboomom.iLikeSchool.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 사용자 추가 api
	@PostMapping("/signup/user")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("nickname") String nickname
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("birthday") String birthday
			, @RequestParam("gender") String gender
			, HttpServletRequest request) {
		
		int count = userBO.addUser(loginId, password, name, nickname, email, phoneNumber, birthday, gender);
		
		Map<String, String> result = new HashMap<>();
		
		User user = new User();
		
		if(count == 1) {
			result.put("result", "success");
			
			user = userBO.getUserbyLoginId(loginId);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			
		} else {
			result.put("result", "fail");
		}
		
		
		return result;
		
	}
	

	
	// 사용자의 학교정보 추가 api
	@GetMapping("/signup/userschool")
	public Map<String, String> signupUserSchool(
			@RequestParam("elementary") String elementary
			, @RequestParam("middelschool") String middleschool
			, @RequestParam("highschool") String highschool
			, @RequestParam("university") String university
			, HttpSession session) {
		
		// 세션에 저장된 userId 주워오고 
		// result success 되면 session에 userId 삭제하기
		int userId = (Integer)session.getAttribute("userId");
				
		int count = userBO.addUserSchool(userId, elementary, middleschool, highschool, university);
		
		Map<String, String> result = new HashMap<>();
		
		if(count != 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
				
	}
	
	
	// 아이디 중복확인 api
	@GetMapping("/loginid/is_duplicated")
	public Map<String, Boolean> isDuplicatedId(@RequestParam("loginId") String loginId) {
		
		Boolean checkId = userBO.isDuplicatedLoginId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", checkId);
		
		return result;
		
	}
	
	// 별명 중복확인 api
	@GetMapping("/nickname/is_duplicated")
	public Map<String, Boolean> isDuplicatedNickname(@RequestParam("nickname") String nickname) {
		
		Boolean checkNickname = userBO.isDuplicatedLoginId(nickname);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", checkNickname);
		
		return result;
		
	}
	
	
	
	
	
}
