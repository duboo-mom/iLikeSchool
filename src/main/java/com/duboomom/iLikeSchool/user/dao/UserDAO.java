package com.duboomom.iLikeSchool.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.user.model.User;

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
		
	public int insertUserSchool(
			@Param("userId") int userId
			, @Param("schoolId") int schoolId);
	
	public User selectUserbyLoginId(@Param("loginId") String loginId);
	
	public boolean existUserByNickname(@Param("nickname") String nickname);
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public String selectLoginId(@Param("name") String name, @Param("email") String email);
	
	public User selectUserbyLoginIdEmail(
			@Param("loginId") String loginId
			, @Param("email") String email);
	
	public int updatePasswordById(@Param("id") int id, @Param("password") String password);
	
	public int updateUser(
			@Param("id") int id
			, @Param("password") String password
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("email") String email
			, @Param("phoneNumber") String phoneNumber
			, @Param("birthday") String birthday
			, @Param("filePath") String filePath);
	
	public int updateUserSchool(
			@Param("id") int id
			, @Param("userId") int userId
			, @Param("schoolId") int schoolId);
	
}
