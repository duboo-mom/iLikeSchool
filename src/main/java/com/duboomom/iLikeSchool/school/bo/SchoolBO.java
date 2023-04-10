package com.duboomom.iLikeSchool.school.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.iLikeSchool.common.FileManagerService;
import com.duboomom.iLikeSchool.school.dao.SchoolDAO;
import com.duboomom.iLikeSchool.school.model.Friend;
import com.duboomom.iLikeSchool.school.model.GuestBook;
import com.duboomom.iLikeSchool.school.model.GuestBookDetail;
import com.duboomom.iLikeSchool.school.model.PostDetail;
import com.duboomom.iLikeSchool.school.model.Schedule;
import com.duboomom.iLikeSchool.school.model.School;
import com.duboomom.iLikeSchool.school.model.SchoolMember;
import com.duboomom.iLikeSchool.school.model.SchoolPost;
import com.duboomom.iLikeSchool.user.bo.UserBO;
import com.duboomom.iLikeSchool.user.model.User;

@Service
public class SchoolBO {
	
	@Autowired
	private SchoolDAO schoolDAO;

	@Autowired
	private UserBO userBO;	
	
	public int checkExistSchool(String elementary
			, String middleschool
			, String highschool
			, String university) {
		
		int count = schoolDAO.selectCountSchool(elementary);
		count += schoolDAO.selectCountSchool(middleschool);
		count += schoolDAO.selectCountSchool(highschool);
		count += schoolDAO.selectCountSchool(university);
		
		return count;
				
	}
	
	public int addSchool(
			String elementary
			, String middleschool
			, String highschool
			, String university) {
		
		int count = 0;
		
		// 학교정보가 null이 아닌 값을 insert school도 해야함..!
		// school DB 조회해서 없으면 추가해야함..!!!!!
		// userSchool에도 등록

		if(elementary != null) {
			if(schoolDAO.selectCountSchool(elementary) == 0) {
				schoolDAO.insertSchool(elementary, "초");
				count++;
			}			
		}
		
		if(middleschool != null) {
			if(schoolDAO.selectCountSchool(middleschool) == 0) {
				schoolDAO.insertSchool(middleschool, "중");
				count++;
			}
		}

		if(highschool != null) {			
			if(schoolDAO.selectCountSchool(highschool) == 0) {
				schoolDAO.insertSchool(highschool, "고");
				count++;
			}
		}
		
		if(university != null) {
			if(schoolDAO.selectCountSchool(university) == 0) {
				schoolDAO.insertSchool(university, "대");
				count++;
			}
		}
		
		return count;
		
	}
	
	public School getSchoolbyName(String schoolName) {
		return schoolDAO.selectSchoolByName(schoolName);
	}
	
	public List<School> getSchoolById(List<Integer> idList) {
		return schoolDAO.selectSchoolById(idList);
	}
	
	public int addSchedule(int userId, int schoolId, String title, String locationInfo, Date dateInfo, String detail) {
		
		return schoolDAO.insertSchedule(userId, schoolId, title, locationInfo, dateInfo, detail);		
	}
	
	public int addElementary(String elementary) {
		return schoolDAO.insertSchool(elementary, "초");
	}
	
	public int addMiddleschool(String middleschool) {
		return schoolDAO.insertSchool(middleschool, "중");
	}
	
	public int addHighschool(String highschool) {
		return schoolDAO.insertSchool(highschool, "고");
	}
	
	public int addUniversity(String university) {
		return schoolDAO.insertSchool(university, "대");
	}
	
	public int addPost(int userId, int schoolId, String content, MultipartFile file) {
		
		String imagePath = null;
		
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);		
		}

		return schoolDAO.insertPost(userId, schoolId, content, imagePath);
		
	}
	
	public int deletePost(int postId, int userId) {
		
		SchoolPost schoolPost = schoolDAO.selectSchoolPost(postId);
				
		if(schoolPost.getImagePath() != null) {
			FileManagerService.removeFile(schoolPost.getImagePath());			
		}
		
		return schoolDAO.deleteSchoolPost(postId, userId);
	}
	
	public List<SchoolPost> getSchoolPostList(int schoolId) {
		return schoolDAO.selectSchoolPostbySchoolId(schoolId);
	}
	
	public List<PostDetail> getPostDetailList(int schoolId) {
		
		List<SchoolPost> schoolPostList = schoolDAO.selectSchoolPostbySchoolId(schoolId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(SchoolPost schoolPost:schoolPostList) {
			
			PostDetail postDetail = new PostDetail();
			
			int userId = schoolPost.getUserId();
			
			postDetail.setId(schoolPost.getId());
			postDetail.setUserId(userId);
			
			User user = userBO.getUserById(userId);
			
			postDetail.setUserName(user.getName());
			postDetail.setUserNickname(user.getNickname());
			postDetail.setUserProfilePath(user.getProfilePath());
			postDetail.setSchoolId(schoolId);
			postDetail.setContent(schoolPost.getContent());
			postDetail.setImagePath(schoolPost.getImagePath());
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
	}

	
	public List<Friend> getFriendList(String friendName, String friendSchoolName) {
		
		List<Integer> userIdList = userBO.getUserIdByName(friendName);
		
		int schoolId = schoolDAO.selectSchoolIdbyName(friendSchoolName);
		
		List<Friend> friendList = new ArrayList<>();
		
		if(userIdList != null) {
			Friend friend = new Friend();
			
			for(Integer friendId:userIdList) {
				
				Integer friendSchoolId = userBO.getUserSchoolId(friendId, schoolId);
				
				if(friendSchoolId != null) {
					friend.setFriendId(friendId);
					friend.setFriendName(friendName);
					friendList.add(friend);					
				}			
			}
			
			return friendList;
			
		} else {
			return null;
		}
	}
	
	public List<Schedule> getSchedulebySchool(int schoolId) {
		return schoolDAO.selectSchedulebySchool(schoolId);
	}
	
	public List<SchoolMember> getSchoolMemberList() {
		return schoolDAO.selectSchoolMemberCount();
	}
	
	public List<PostDetail> getRecentSchoolPostDetail() {

		List<SchoolPost> schoolPostList = schoolDAO.selectSchoolPostLimit2();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(SchoolPost schoolPost:schoolPostList) {
			
			PostDetail postDetail = new PostDetail();
			
			int userId = schoolPost.getUserId();
			
			postDetail.setId(schoolPost.getId());
			postDetail.setUserId(userId);
			
			User user = userBO.getUserById(userId);
			
			postDetail.setUserName(user.getName());
			postDetail.setUserNickname(user.getNickname());
			postDetail.setUserProfilePath(user.getProfilePath());
			postDetail.setSchoolId(schoolPost.getSchoolId());
			postDetail.setContent(schoolPost.getContent());
			postDetail.setImagePath(schoolPost.getImagePath());
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
		
	}
	
	public int addGuestBook(int userId, int writerId, String comment) {
		return schoolDAO.insertGuestBook(userId, writerId, comment);
	}
	
	public List<GuestBookDetail> getGuestBookDetail(int bookUserId) {
		
		List<GuestBook> guestBookList = schoolDAO.selectGuestBookByUserId(bookUserId);
		
		List<GuestBookDetail> bookDetailList = new ArrayList<>();
		
		for(GuestBook guestBook:guestBookList) {
			
			GuestBookDetail bookDetail = new GuestBookDetail();
			int writerId = guestBook.getWriterId();
			
			User writer = userBO.getUserById(writerId);
			
			bookDetail.setUserName(writer.getName());
			bookDetail.setUserNickname(writer.getNickname());
			bookDetail.setComment(guestBook.getComment());
			
			bookDetailList.add(bookDetail);
		}
		
		return bookDetailList;
		
	}
	
}
