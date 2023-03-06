package com.duboomom.iLikeSchool.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.common.EncryptUtils;
import com.duboomom.iLikeSchool.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String nickname
			, String email
			, String phoneNumber
			, String birthday
			, String gender
			, String elementary
			, String middleschool
			, String highschool
			, String university) {
		
		// 비밀번호 암호화해서 dao로 넘기기
		String encryptPassword = EncryptUtils.md5(password);
				
		// insert user 하고
		
		int addUserCount = userDAO.insertUser(loginId, encryptPassword, name, nickname, email, phoneNumber, birthday, gender);
				
		// 학교정보가 null이 아닌 값을 insert school도 해야함..!
		// school DB 조회해서 없으면 추가해야함..!!!!!
		
		if()
		
		// userSchool에도 등록
		
		
	}
	
}
