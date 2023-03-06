package com.duboomom.iLikeSchool.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("email") String email
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("gender") String gender);
	
	public int insertSchool(
			@Param("name") String schoolName
			, @Param("type") String type);
	
	public int insertUserSchool(
			@Param("userId") int userId
			, @Param("schoolId") int schoolId);
	
	public int selectCountSchool(@Param("name") String schoolName);
	
	
}
