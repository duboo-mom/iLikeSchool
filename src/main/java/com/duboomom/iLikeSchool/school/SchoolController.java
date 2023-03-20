package com.duboomom.iLikeSchool.school;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/school")
public class SchoolController {

	@GetMapping("/main")
	public String main() {
		return "school/main";
	}
	
	@GetMapping("/news/view")
	public String news() {
		return "school/news";
	}
	
	@GetMapping("/reunion/view")
	public String reunion() {
		return "school/reunion";
	}
}
