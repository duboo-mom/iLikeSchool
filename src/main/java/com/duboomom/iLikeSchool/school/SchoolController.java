package com.duboomom.iLikeSchool.school;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duboomom.iLikeSchool.school.bo.SchoolNewsBO;
import com.duboomom.iLikeSchool.school.vote.bo.VoteBO;
import com.duboomom.iLikeSchool.school.vote.model.Vote;
import com.duboomom.iLikeSchool.school.vote.model.VoteItem;
import com.duboomom.iLikeSchool.school.vote.model.VoteItemResult;
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

	@Autowired
	private VoteBO voteBO;
	
	@GetMapping("/main")
	public String main() {
		return "school/main";
	}
	
	@GetMapping("/news/view")
	public String news(Model model, HttpSession session) throws JsonMappingException, JsonProcessingException {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		
		if(userDetail.getElementary() != null) {
			model.addAttribute("newsList", schoolNewsBO.requestNews(userDetail.getElementary()));
		} else {
			model.addAttribute("newsList", null);
		}
		
		return "school/news";
	}
	
	@GetMapping("/reunion/view")
	public String reunion(Model model, HttpSession session) {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		
		return "school/reunion";
	}
	
	@GetMapping("/schedule/view")
	public String scheduleInputView(@RequestParam("schoolId") int schoolId) {
		return "school/schedule/create";
	}
	
	@GetMapping("/vote/create/view")
	public String voteView(@RequestParam("schoolId") int schoolId) {
		return "school/vote/create";
	}
	
	@GetMapping("/vote/list/view")
	public String voteListView(
			@RequestParam("schoolId") int schoolId
			, Model model) {
		
		Date now = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(now);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		calendar.add(Calendar.DATE, 1);
		
		model.addAttribute("now", formatter.format(calendar.getTime()));
		
		List<Vote> voteList = voteBO.getVoteList(schoolId);
		
		model.addAttribute("voteList", voteList);
		
		return "school/vote/list";
	}
	
	@GetMapping("/vote/voting/view")
	public String votingView(@RequestParam("voteId") int voteId, Model model) {
		
		// voteId로 voteItem 조회해서 해당 item들만 보여주기
		
		List<VoteItem> itemList = voteBO.getVoteItemList(voteId);
		
		model.addAttribute("voteItems", itemList);
		
		model.addAttribute("title", voteBO.getVoteTitle(voteId));
		
		return "school/vote/voting";
	}
	
	@GetMapping("/vote/result/view")
	public String voteResultView(@RequestParam("voteId") int voteId, Model model) {
		
		// voteId로 조회해서 해당하는 item result들의 합 보여주기
		List<VoteItemResult> resultList = voteBO.getVoteResult(voteId);
		
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("title", voteBO.getVoteTitle(voteId));
		
		return "school/vote/result";
	}
	
	@GetMapping("/gathering/list/view")
	public String gatheringListView(@RequestParam("schoolId") int schoolId) {
		return "school/gathering/list";
	}
	
	@GetMapping("/gathering/create/view")
	public String gatheringInput(@RequestParam("schoolId") int schoolId) {
		return "school/gathering/create";
	}

	@GetMapping("/gathering/main/view")
	public String gatheringMainView(@RequestParam("gatheringId") int gatheringId) {
		return "school/gathering/main";
	}
	
	@GetMapping("/create/view")
	public String postCreateView(@RequestParam("schoolId") int schoolId) {
		return "school/create";
	}
	
	@GetMapping("/find-friend/view")
	public String findFriendView() {
		return "school/findFriend";
	}
	
	@GetMapping("/guestbook/view")
	public String guestbookView() {
		return "school/guestbook";
	}
	
	// news 본문에 해당하는 html div 만 보여주는
	@GetMapping("/news/content/div")
	public String newsContent(
			Model model
			, HttpSession session
			, @RequestParam("schoolName") String schoolName) throws JsonMappingException, JsonProcessingException {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		model.addAttribute("schoolName", schoolName);

		if(schoolName != null) {
			model.addAttribute("newsList", schoolNewsBO.requestNews(schoolName));
		} else {
			model.addAttribute("newsList", null);
		}
		
		return "school/newsContent";
	}
}
