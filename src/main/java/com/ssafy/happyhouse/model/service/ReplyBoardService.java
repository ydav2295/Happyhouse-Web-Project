package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.ReplyBoard;

public interface ReplyBoardService {

	List<ReplyBoard> retrieveReplyBoardByQnANo(int qnaNo);

	ReplyBoard retrieveReplyBoardByReplyNo(int replyNo);
	
	boolean writeReplyBoard(ReplyBoard replyBoard);

	boolean updateReplyBoard(ReplyBoard replyBoard);

	boolean deleteReplyBoard(int replyNo);
}

