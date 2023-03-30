package com.duboomom.iLikeSchool.school.vote.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.vote.dao.VoteDAO;
import com.duboomom.iLikeSchool.school.vote.model.Vote;

@Service
public class VoteBO {

	@Autowired
	private VoteDAO voteDAO;
	
	public int addVote(int schoolId, int userId, String title, Date endDate) {
		return voteDAO.insertVote(schoolId, userId, title, endDate);
	}
		
	public int addVoteItems(int schoolId, int userId, String title, String item1, String item2, String item3, String item4, String item5) {
		
		Integer voteId = voteDAO.selectVoteIdbyTitle(schoolId, userId, title);
		
		int count = 0;

		if(item1.length() != 0) {
			voteDAO.insertVoteItem(voteId, item1);
			count++;
		}
		
		if(item2.length() != 0) {
			voteDAO.insertVoteItem(voteId, item2);
			count++;
		}
		
		if(item3.length() != 0) {
			voteDAO.insertVoteItem(voteId, item3);
			count++;
		}
		
		if(item4.length() != 0) {
			voteDAO.insertVoteItem(voteId, item4);
			count++;
		}
		
		if(item5.length() != 0) {
			voteDAO.insertVoteItem(voteId, item5);
			count++;
		}
		
		return count;
	}
	
	public List<Vote> getVoteList(int schoolId) {
		return voteDAO.selectVote(schoolId);
	}
	
	
}
