package com.duboomom.iLikeSchool.school.vote.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.iLikeSchool.school.vote.model.Vote;
import com.duboomom.iLikeSchool.school.vote.model.VoteItem;
import com.duboomom.iLikeSchool.school.vote.model.VoteItemResult;
import com.duboomom.iLikeSchool.school.vote.model.VoteResultCount;

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

	public int deleteVote(
			@Param("voteId") int voteId
			, @Param("userId") int userId);
	
	public int deleteVoteItems(@Param("voteId") int voteId);
	
	public List<VoteItem> selectVoteItems(@Param("voteId") int voteId);
	
	public String selectTitlebyId(@Param("id") int voteId);
	
	public int insertVoteResult(@Param("userId") int userId, @Param("itemId") int itemId);
	
	public int selectResultCount(@Param("itemId") int itemId);
	
}
