package com.duboomom.iLikeSchool.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.iLikeSchool.common.EncryptUtils;
import com.duboomom.iLikeSchool.common.FileManagerService;
import com.duboomom.iLikeSchool.school.bo.SchoolBO;
import com.duboomom.iLikeSchool.school.model.School;
import com.duboomom.iLikeSchool.user.dao.UserDAO;
import com.duboomom.iLikeSchool.user.model.User;
import com.duboomom.iLikeSchool.user.model.UserDetail;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private SchoolBO schoolBO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String nickname
			, String email
			, String phoneNumber
			, String birthday
			, String gender) {
		
		// 비밀번호 암호화해서
		String encryptPassword = EncryptUtils.md5(password);
				
		// insert user 하기		
		return userDAO.insertUser(loginId, encryptPassword, name, nickname, email, phoneNumber, birthday, gender);
		
				
	}
	
	
	public int addUserSchool(
			int userId
			, String elementary
			, String middleschool
			, String highschool
			, String university) {
		
		// 방금 추가된 userId = session에서 주워오기...?
		// user가 선택한 학교 정보의 schoolId로 insert하기
		
		School school = new School();
		int count = 0;
		
		// 초등학교 정보 있으면
		if(elementary != "") {
			
			school = schoolBO.getSchoolbyName(elementary);
			
			count += userDAO.insertUserSchool(userId, school.getId());
						
		}
		
		// 중, 고, 대 반복
		
		if(middleschool != "") {
			school = schoolBO.getSchoolbyName(middleschool);
			
			count += userDAO.insertUserSchool(userId, school.getId());
		} 		
		
		if(highschool != "") {
			school = schoolBO.getSchoolbyName(highschool);
			
			count += userDAO.insertUserSchool(userId, school.getId());
		}		
		
		if(university != "") {
			school = schoolBO.getSchoolbyName(university);
			
			count += userDAO.insertUserSchool(userId, school.getId());
		}		
		
		return count;
		
	}
	
	
	public User getUser(String loginId, String password) {
		
		return userDAO.selectUser(loginId, EncryptUtils.md5(password));
		
	}
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
	public User getUserbyLoginId(String loginId) {
		
		return userDAO.selectUserbyLoginId(loginId);
		
	}
	
	public Boolean isDuplicatedLoginId(String loginId) {
		
		User user = new User();
		
		user = userDAO.selectUserbyLoginId(loginId);
		
		if(user == null) {
			return false;
		} else {
			return true;
		}
		
	}
		
	public Boolean isDuplicatedNickname(String nickname) {
		
		return userDAO.existUserByNickname(nickname);
		
	}
	
	public String getLoginId(String name, String email) {
		
		return userDAO.selectLoginId(name, email);
		
	}
	
	public User getUserByIdEmail(String loginId, String email) {
		return userDAO.selectUserbyLoginIdEmail(loginId, email);
	}
	
	public void changeTempPw(int id, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		userDAO.updatePasswordById(id, encryptPassword);
		
	}
	
	public Boolean isExistenceUserschool(int userId) {
		
		int count = userDAO.existUserSchool(userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	
	public int changeMyprofile(
			int userId
			, String password
			, String nickname
			, String email
			, String phoneNumber
			, String birthday
			, MultipartFile file) {
		
		String imagePath = null;
		
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);		
		}
		
		String encryptPassword = EncryptUtils.md5(password);
		
		int count = userDAO.updateUser(userId, encryptPassword, nickname, email, phoneNumber, birthday, imagePath);
		
		return count;
		
	}
	
	
	// 사용자 정보 + 사용자 학교정보 조회
	public UserDetail getUserDetail(int id) {
		
		UserDetail userDetail = new UserDetail();
		
		User user = userDAO.selectUserById(id);
		
		userDetail.setId(id);
		userDetail.setNickname(user.getNickname());
		userDetail.setPassword(user.getPassword());
		userDetail.setEmail(user.getEmail());
		userDetail.setPhoneNumber(user.getPhoneNumber());
		userDetail.setYymmdd(user.getYymmdd());
		
		// 사용자 학교정보 넣기
		
		List<Integer> intList = userDAO.selectUserSchoolbyUserId(id);
		
		List<School> schoolList = schoolBO.getSchoolById(intList);
		
		for(School school : schoolList) {
			
			String schoolType = school.getType();
			String schoolName = school.getName();
			
			if(schoolType.equals("초") ) {
				userDetail.setElementary(schoolName);
				userDetail.setElementaryId(school.getId());
			} else if(schoolType.equals("중")) {
				userDetail.setMiddleSchool(schoolName);
				userDetail.setMiddleschoolId(school.getId());
			} else if(schoolType.equals("고")) {
				userDetail.setHighSchool(schoolName);
				userDetail.setHighschoolId(school.getId());
			} else if(schoolType.equals("대")){
				userDetail.setUniversity(schoolName);
				userDetail.setUniversityId(school.getId());
			}
			
		}
						
		return userDetail;
		
	}
	
	public int editUserSchool(int id, int userId, int schoolId) {
		
		return userDAO.updateUserSchool(id, userId, schoolId);
		
	}
	
	public int getUserSchoolId(int userId, int schoolId) {
		return userDAO.selectIdByUserSchool(userId, schoolId);
	}
	
	public int addUserSchoolSingle(int userId, int schoolId) {
		return userDAO.insertUserSchool(userId, schoolId);
	}
	

}
