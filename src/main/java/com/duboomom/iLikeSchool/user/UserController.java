package com.duboomom.iLikeSchool.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	@GetMapping("/signup-school/view")
	public String signup2View() {
		return "user/signupSchool";
	}
	
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	// 로그아웃
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userNickname");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin/view";
		
	}
	
	@GetMapping("/find_id/view")
	public String findIdView() {
		return "user/findId";
	}
	
}
