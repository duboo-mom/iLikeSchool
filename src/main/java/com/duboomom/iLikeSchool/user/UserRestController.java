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
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.iLikeSchool.school.bo.SchoolBO;
import com.duboomom.iLikeSchool.school.model.School;
import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private SchoolBO schoolBO;
	
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

		if(count == 1) {
			result.put("result", "success");
			
		} else {
			result.put("result", "fail");
		}
		
		
		return result;
		
	}
	

	
	// 사용자의 학교정보 추가 api
	@GetMapping("/signup/userschool")
	public Map<String, String> signupUserSchool(
			@RequestParam(value = "elementary", required = false) String elementary
			, @RequestParam(value = "middleschool", required = false) String middleschool
			, @RequestParam(value = "highschool", required = false) String highschool
			, @RequestParam(value = "university", required = false) String university
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
	// 회원가입, 마이페이지 두번 사용
	@GetMapping("/nickname/is_duplicated")
	public Map<String, Boolean> isDuplicatedNickname(
			@RequestParam("nickname") String nickname
			, HttpSession session) {

		String userNick = (String)session.getAttribute("userNickname");

		Map<String, Boolean> result = new HashMap<>();
		
		Boolean checkNickname = userBO.isDuplicatedNickname(nickname);
		
		if(userNick == null) {
			result.put("result", checkNickname);
		} else {
			if(nickname.equals(userNick)) {
				result.put("result", false);
			} else {
				result.put("result", checkNickname);		
			}		
		}
		
		return result;
		
	}
	
	
	// 로그인 api
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickname", user.getNickname());
		} else {
			result.put("result", "fail");			
		}
		
		return result;
	}
	
	
	// 아이디 찾기 api
	@GetMapping("/find_id")
	public Map<String, Object> findUserId(
			@RequestParam("name") String name
			, @RequestParam("email") String email) {
		
		String userLoginId = userBO.getLoginId(name, email);
		
		Map<String, Object> result = new HashMap<>();
		
		if(userLoginId != null) {
			result.put("result", "success");
			result.put("loginId", userLoginId);
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 비밀번호 찾기 api
	@GetMapping("/find_pw")
	public Map<String, Object> findTempPassword(
			@RequestParam("loginId") String loginId
			, @RequestParam("email") String email){
		
		User user = userBO.getUserByIdEmail(loginId, email);
		
		Map<String, Object> result = new HashMap<>();
		
		if(user != null) {
			
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
						
			// 비밀번호 변경
			userBO.changeTempPw(user.getId(), pw);			
			
			result.put("result", "success");
			result.put("password", pw);
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 사용자정보 수정 api
	@PostMapping("/edit/userinfo")
	public Map<String, String> editMypage(
			@RequestParam("password") String password
			, @RequestParam("nickname") String nickname
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("birthday") String birthday
			, @RequestParam(value = "file", required = false) MultipartFile file
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.changeMyprofile(userId, password, nickname, email, phoneNumber, birthday, file);		
		
		Map<String, String> result = new HashMap<>();
				
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 사용자 학교정보 저장되어 있는지
	@GetMapping("/userschool/is_existence")
	public Map<String, Boolean> isExistenceUserschool(HttpSession session) {
		
		int id = (Integer)session.getAttribute("userId");
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", userBO.isExistenceUserschool(id));
		
		return result;		
				
	}
	
	
	@GetMapping("/edit/school")
	public Map<String, String> editUserSchool(
			@RequestParam(value = "schoolName") String schoolName
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		School school = schoolBO.getSchoolbyName(schoolName);
		
		int count = 0;
		
		// 이거를 BO에서 처리했어야 할까??
		if(school == null) {
			// 우선 school테이블 추가
			if(schoolName.contains("초등학교")) {
				schoolBO.addElementary(schoolName);				
			} else if(schoolName.contains("중학교")) {
				schoolBO.addMiddleschool(schoolName);
			} else if(schoolName.contains("고등학교")) {
				schoolBO.addHighschool(schoolName);
			} else if(schoolName.contains("대학교")) {
				schoolBO.addUniversity(schoolName);
			}
			
			School newSchool = schoolBO.getSchoolbyName(schoolName);
			// 그다음 사용자 학교 저장
			count = userBO.addUserSchoolSingle(userId, newSchool.getId());

		} else {
			int schoolId = school.getId();
			// edit 하면되고
			
			Integer userSchoolId = userBO.getUserSchoolId(userId, schoolId);
			
			if(userSchoolId == null) {
				count = userBO.addUserSchoolSingle(userId, schoolId);
			} else {
				count = userBO.editUserSchool(userSchoolId, userId, schoolId);				
			}
						
		}
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
	
		
	
}
