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
	
}
