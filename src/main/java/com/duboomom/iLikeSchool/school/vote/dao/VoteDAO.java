package com.duboomom.iLikeSchool.school.vote.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VoteDAO {

	public int insertVote(
			@Param("schoolId") int schoolId
			,@Param("userId") int userId
			, @Param("title") String title
			, @Param("endDate") Date endDate);
	
	public int selectVoteIdbyTitle(
			@Param("schoolId") int schoolId
			,@Param("userId") int userId
			, @Param("title") String title);
	
	public int insertVoteItem(
			@Param("voteId") int voteId
			, @Param("item") String item);
	
}
