package com.duboomom.iLikeSchool.school.vote.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.school.vote.model.Vote;

@Repository
public interface VoteDAO {

	public int insertVote(
			@Param("schoolId") int schoolId
			,@Param("userId") int userId
			, @Param("title") String title
			, @Param("endDate") Date endDate);
	
	public Integer selectVoteIdbyTitle(
			@Param("schoolId") int schoolId
			,@Param("userId") int userId
			, @Param("title") String title);
	
	public int insertVoteItem(
			@Param("voteId") int voteId
			, @Param("item") String item);
	
	public List<Vote> selectVote(@Param("schoolId") int schoolId);
	
}
