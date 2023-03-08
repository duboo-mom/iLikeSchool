package com.duboomom.iLikeSchool.user;

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
}
