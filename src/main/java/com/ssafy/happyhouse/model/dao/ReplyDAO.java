package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.ReplyBoard;

public interface ReplyDAO {
	List<ReplyBoard> selectReplyBoardByQnANo(int qnaNo);
	
	ReplyBoard selectReplyBoardByReplyNo(int replyNo);
	
	boolean insertReplyBoard(ReplyBoard replyBoard);

	boolean updateReplyBoard(ReplyBoard replyBoard);

	boolean deleteReplyBoard(int replyNo);
}
