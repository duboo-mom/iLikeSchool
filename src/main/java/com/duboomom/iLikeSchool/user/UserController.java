package com.duboomom.iLikeSchool.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.UserDetail;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
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
	
	@GetMapping("/find_pw/view")
	public String findPwView() {
		return "user/findpw";
	}
	
	// 사용자 정보
	// 사용자 학교정보
	@GetMapping("/mypage/view")
	public String mypageView(
			HttpSession session
			, Model model) {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);

		model.addAttribute("user", userDetail);
		
		return "user/mypage";
	}
	
}
