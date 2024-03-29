package com.duboomom.iLikeSchool.school.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.school.model.GuestBook;
import com.duboomom.iLikeSchool.school.model.Schedule;
import com.duboomom.iLikeSchool.school.model.School;
import com.duboomom.iLikeSchool.school.model.SchoolMember;
import com.duboomom.iLikeSchool.school.model.SchoolPost;

@Repository
public interface SchoolDAO {

	public int insertSchool(
			@Param("name") String schoolName
			, @Param("type") String type);
	
	public int selectCountSchool(@Param("name") String schoolName);
	
	public School selectSchoolByName(@Param("name") String schoolName);
	
	public List<School> selectSchoolById(List<Integer> idList);
	
	public int insertSchedule(
			@Param("userId") int userId
			, @Param("schoolId") int schoolId
			, @Param("title") String title
			, @Param("locationInfo") String locationInfo
			, @Param("dateInfo") Date dateinfo
			, @Param("detail") String detail);
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("schoolId") int schoolId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public SchoolPost selectSchoolPost(@Param("id") int id);
	
	public List<SchoolPost> selectSchoolPostbySchoolId(@Param("schoolId") int schoolId);
	
	public int deleteSchoolPost(@Param("id") int id, @Param("userId") int userId);
	
	public int selectSchoolIdbyName(@Param("name") String schoolName);
	
	public List<Schedule> selectSchedulebySchool(@Param("schoolId") int schoolId);
	
	public List<SchoolMember> selectSchoolMemberCount();
	
	public List<SchoolPost> selectSchoolPostLimit2();
	
	public int insertGuestBook(
			@Param("userId") int userId
			, @Param("writerId") int writerId
			, @Param("comment") String comment);
	
	public List<GuestBook> selectGuestBookByUserId(@Param("userId") int userId);
}
