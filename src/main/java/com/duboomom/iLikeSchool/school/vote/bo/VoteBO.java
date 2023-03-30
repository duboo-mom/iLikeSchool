package com.duboomom.iLikeSchool.school.vote.bo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.vote.dao.VoteDAO;

@Service
public class VoteBO {

	@Autowired
	private VoteDAO voteDAO;
	
	public int addVote(int schoolId, int userId, String title, Date endDate) {
		return voteDAO.insertVote(schoolId, userId, title, endDate);
	}
		
	public int addVoteItems(int schoolId, int userId, String title, String item1, String item2, String item3, String itme4, String item5) {
		
		int voteId = voteDAO.selectVoteIdbyTitle(schoolId, userId, title);
		
		int count = 0;
		
		for(int i = 1; i <= 5; i++) {
			
			String itemNum = "item" + i;
			
			if(itemNum != null) {
				voteDAO.insertVoteItem(voteId, itemNum);
				count++;
			}
		}
		
		return count;
	}
}
