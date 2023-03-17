package com.duboomom.iLikeSchool.school.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.school.model.School;

@Repository
public interface SchoolDAO {

	public int insertSchool(
			@Param("name") String schoolName
			, @Param("type") String type);
	
	public int selectCountSchool(@Param("name") String schoolName);
	
	public School selectSchoolByName(@Param("name") String schoolName);
	
	public List<School> selectSchoolById(List<Integer> idList);
}
