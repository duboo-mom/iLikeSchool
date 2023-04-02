package com.duboomom.iLikeSchool.school;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duboomom.iLikeSchool.school.bo.SchoolBO;
import com.duboomom.iLikeSchool.school.bo.SchoolNewsBO;
import com.duboomom.iLikeSchool.school.gathering.bo.GatheringBO;
import com.duboomom.iLikeSchool.school.gathering.model.Gathering;
import com.duboomom.iLikeSchool.school.gathering.model.GatheringDetail;
import com.duboomom.iLikeSchool.school.model.Friend;
import com.duboomom.iLikeSchool.school.model.MainDetail;
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
	
	@Autowired
	private GatheringBO gatheringBO;
	
	@Autowired
	private SchoolBO schoolBO;
	
	@GetMapping("/main")
	public String main(Model model) throws JsonMappingException, JsonProcessingException {
		
		MainDetail mainDetail = new MainDetail();
		
		mainDetail.setSchoolMemberList(schoolBO.getSchoolMemberList());
		mainDetail.setPostDetailList(schoolBO.getRecentSchoolPostDetail());
		mainDetail.setSchoolNewsList(schoolNewsBO.requestNews("학교", 2));
		
		model.addAttribute("mainDetail", mainDetail);
		
		return "school/main";
	}
	
	// 학교소식 페이지 처음엔 초등학교 정보로
	@GetMapping("/news/view")
	public String news(Model model, HttpSession session) throws JsonMappingException, JsonProcessingException {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		
		if(userDetail.getElementary() != null) {
			model.addAttribute("newsList", schoolNewsBO.requestNews(userDetail.getElementary(), 5));
		} else {
			model.addAttribute("newsList", null);
		}
		
		return "school/news";
	}
	
	// 동창회 페이지 처음엔 초등학교 정보로
	@GetMapping("/reunion/view")
	public String reunion(Model model, HttpSession session) {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		
		// 투표 title 필요한데
		// voteList로 가져가서 그중에 title만 가져오기
		int schoolId = userDetail.getElementaryId();
		model.addAttribute("voteList", voteBO.getVoteList(schoolId));
		
		// schoolPost 리스트
		model.addAttribute("schoolPostList", schoolBO.getPostDetailList(schoolId));
		
		return "school/reunion";
	}
	
	// 동창회 페이지 선택시 새로고침해서 보여줄 div
	@GetMapping("/reunion/select/div")
	public String refreshReunionView(Model model, HttpSession session, @RequestParam("schoolId") int schoolId) {
		
		int id = (Integer)session.getAttribute("userId");
		
		UserDetail userDetail = userBO.getUserDetail(id);
		
		model.addAttribute("user", userDetail);
		
		// 투표 title 필요한데
		// voteList로 가져가서 그중에 title만 가져오기
		
		model.addAttribute("voteList", voteBO.getVoteList(schoolId));
		
		// schoolPost 리스트
		model.addAttribute("schoolPostList", schoolBO.getPostDetailList(schoolId));
		
		return "school/reunionContent";
		
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
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(now);
//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		calendar.add(Calendar.DATE, 1);
		
//		model.addAttribute("now", formatter.format(calendar.getTime()));
		
		model.addAttribute("now", now);
		
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
	public String gatheringListView(@RequestParam("schoolId") int schoolId, Model model) {
		
		List<Gathering> gatheringList = gatheringBO.getGatherings(schoolId);
		
		model.addAttribute("gatheringList", gatheringList);
		
		return "school/gathering/list";
	}
	
	@GetMapping("/gathering/create/view")
	public String gatheringInput(@RequestParam("schoolId") int schoolId) {
		return "school/gathering/create";
	}

	@GetMapping("/gathering/main/view")
	public String gatheringMainView(
			@RequestParam("gatheringId") int gatheringId
			, Model model
			, HttpSession session) {
		
		// GatheringDetail을 model에 넣기
		GatheringDetail gatheringDetail = gatheringBO.getGatheringDetail(gatheringId);
		
		model.addAttribute("gatheringDetail", gatheringDetail);
		
		return "school/gathering/main";
	}
	
	@GetMapping("/gathering/join/view")
	public String joinGatheringView(
			@RequestParam("gatheringId") int gatheringId
			, Model model
			, HttpSession session) {

		GatheringDetail gatheringDetail = gatheringBO.getGatheringDetail(gatheringId);
				
		model.addAttribute("gatheringDetail", gatheringDetail);		
		
		return "school/gathering/join";
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
	public String guestbookView(@RequestParam("bookUserId") int userId) {
				
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
			model.addAttribute("newsList", schoolNewsBO.requestNews(schoolName, 5));
		} else {
			model.addAttribute("newsList", null);
		}
		
		return "school/newsContent";
	}
	
	// 친구찾기 결과 html
	@GetMapping("/findfriend/result/div")
	public String friendResult(
			Model model
			, @RequestParam("friendName") String friendName
			, @RequestParam("friendSchool") String friendSchool) {
		
		List<Friend> friendList = schoolBO.getFriendList(friendName, friendSchool);
		
		model.addAttribute("friendList", friendList);
		
		return "school/findFriendResult";
		
	}
	
	// 일정 만들기
	@GetMapping("/schedule/view")
	public String scheduleInputView(@RequestParam("schoolId") int schoolId) {
		return "school/schedule/create";
	}
	
	// 달력 화면 새창
	@GetMapping("/schedule/calendar/view")
	public String scheduleDetailView(@RequestParam("schoolId") int schoolId) {
		return "school/schedule/calendar";
	}
	
}
