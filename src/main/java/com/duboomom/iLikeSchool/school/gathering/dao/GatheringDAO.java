package com.duboomom.iLikeSchool.school.gathering.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.school.gathering.model.Gathering;
import com.duboomom.iLikeSchool.school.gathering.model.GatheringComment;

@Repository
public interface GatheringDAO {
	
	public int insertGathering(
			@Param("userId") int userId,
			@Param("schoolId") int schoolId,
			@Param("title") String title,
			@Param("detail") String detail);
	
	public List<Gathering> selectGathering(@Param("schoolId") int schoolId); 

	public int insertGatheringMember(@Param("userId") int userId, @Param("gatheringId") int gatheringId);
	
	public int selectMemberCount(@Param("userId") int userId, @Param("gatheringId") int gatheringId);
	
	public int insertGatheringComment(
			@Param("userId") int userId
			, @Param("gatheringId") int gatheringId
			, @Param("comment") String comment);
	
	public int updateGatheringAnnouncement(
			@Param("userId") int userId
			, @Param("gatheringId") int gatheringId
			, @Param("announcement") String announcement);

	public Gathering selectGatheringById(@Param("gatheringId") int gatheringId);
	
	public List<GatheringComment> selectCommentByGatheringId(@Param("gatheringId") int gatheringId);

	public int deleteGatheringMember(@Param("gatheringId") int gatheringId, @Param("userId") int userId);
		
}
