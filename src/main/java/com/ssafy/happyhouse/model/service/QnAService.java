package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.QnABean;

public interface QnAService {

	List<QnA> retrieveQnA();
	
	List<QnA> retrieveQnAByBean(QnABean qnABean);

	QnA detailQnA(int qnaNo);

	boolean writeQnA(QnA qna);

	boolean updateQnA(QnA qna);

	boolean deleteQnA(int qnaNo);
}
