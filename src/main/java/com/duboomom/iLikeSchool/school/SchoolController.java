package com.duboomom.iLikeSchool.school;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duboomom.iLikeSchool.school.bo.SchoolNewsBO;
import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.UserDetail;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
@RequestMapping("/school")
public class SchoolController {

	@Autowired
	private SchoolNewsBO schoolNewsBO;

	@Autowired
	private UserBO userBO;
	
	@GetMapping("/main")
	public String main() {
		return "school/main";
	}
	
	@GetMapping("/news/view")
	public String news(Model model, HttpSession session) throws JsonMappingException, JsonProcessingException {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
//		if(userDetail.getUniversity() != null) {
//			model.addAttribute("newsList", schoolNewsBO.requestNews(userDetail.getUniversity()));
//		} else {
//			model.addAttribute("newsList", null);
//		}

		model.addAttribute("newsList", schoolNewsBO.requestNews("동원초등학교"));
		
		return "school/news";
	}
	
	@GetMapping("/reunion/view")
	public String reunion() {
		return "school/reunion";
	}
	
	@GetMapping("/schedule/view")
	public String scheduleInputView() {
		return "school/schedule/create";
	}
	
	@GetMapping("/vote/create/view")
	public String voteView() {
		return "school/vote/create";
	}
	
	@GetMapping("/vote/list/view")
	public String voteListView() {
		return "school/vote/list";
	}
	
	@GetMapping("/gathering/list/view")
	public String gatheringListView() {
		return "school/gathering/list";
	}
	
	@GetMapping("/gathering/create/view")
	public String gatheringInput() {
		return "school/gathering/create";
	}

	@GetMapping("/gathering/main/view")
	public String gatheringMainView() {
		return "school/gathering/main";
	}
	
	@GetMapping("/create/view")
	public String postCreateView() {
		return "school/create";
	}
	
	@GetMapping("/find-friend/view")
	public String findFriendView() {
		return "school/findFriend";
	}
	
}
