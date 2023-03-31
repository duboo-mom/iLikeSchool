package com.duboomom.iLikeSchool.school.gathering.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GatheringDAO {
	
	public int insertGathering(
			@Param("userId") int userId,
			@Param("schoolId") int schoolId,
			@Param("title") String title,
			@Param("detail") String detail);

}
