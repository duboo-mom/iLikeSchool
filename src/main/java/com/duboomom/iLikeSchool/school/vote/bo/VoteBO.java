package com.duboomom.iLikeSchool.school.vote.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.iLikeSchool.school.vote.dao.VoteDAO;
import com.duboomom.iLikeSchool.school.vote.model.Vote;
import com.duboomom.iLikeSchool.school.vote.model.VoteItem;
import com.duboomom.iLikeSchool.school.vote.model.VoteItemResult;

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
	
	public int deleteVote(int voteId, int userId) {
		
		int count = voteDAO.deleteVote(voteId, userId);
		
		if(count == 1) {
			
			// 해당 투표의 item들도 삭제해야됨
			voteDAO.deleteVoteItems(voteId);
		}
		
		return count;
	}
	
	// 아이템 조회하기
	public List<VoteItem> getVoteItemList(int voteId) {
		
		return voteDAO.selectVoteItems(voteId);
		
	}
	
	// 투표 제목만 조회
	public String getVoteTitle(int voteId) {
		return voteDAO.selectTitlebyId(voteId);
	}
	
	// 투표하기
	public int addVoteResult(int userId, int itemId) {
		return voteDAO.insertVoteResult(userId, itemId);
	}
	
	// 결과 리스트 만들기
	public List<VoteItemResult> getVoteResult(int voteId) {
		
		List<VoteItem> itemList = voteDAO.selectVoteItems(voteId);
		
		List<VoteItemResult> resultList = new ArrayList<>();
		
		for(VoteItem item:itemList) {
			
			VoteItemResult voteResult = new VoteItemResult();
			
			int itemId = item.getId();
			String itemName = item.getItem();
			
			int count = voteDAO.selectResultCount(itemId);
			
			voteResult.setVoteId(voteId);
			voteResult.setItem(itemName);
			voteResult.setCount(count);
			
			resultList.add(voteResult);
			
		}
		
		return resultList;
		
	}
	
	
}
