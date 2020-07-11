package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.ReplyDAO;
import com.ssafy.happyhouse.model.dto.ReplyBoard;

@Service
public class ReplyBoardServiceImpl implements ReplyBoardService {
	@Autowired
	private ReplyDAO replyDao;

	@Override
	public List<ReplyBoard> retrieveReplyBoardByQnANo(int qnaNo) {
		// TODO Auto-generated method stub
		return replyDao.selectReplyBoardByQnANo(qnaNo);
	}

	@Override
	public boolean writeReplyBoard(ReplyBoard replyBoard) {
		// TODO Auto-generated method stub
		return replyDao.insertReplyBoard(replyBoard);
	}

	@Override
	public boolean updateReplyBoard(ReplyBoard replyBoard) {
		// TODO Auto-generated method stub
		return replyDao.updateReplyBoard(replyBoard);
	}

	@Override
	public boolean deleteReplyBoard(int replyNo) {
		// TODO Auto-generated method stub
		return replyDao.deleteReplyBoard(replyNo);
	}

	@Override
	public ReplyBoard retrieveReplyBoardByReplyNo(int replyNo) {
		// TODO Auto-generated method stub
		return replyDao.selectReplyBoardByReplyNo(replyNo);
	}
	

}
