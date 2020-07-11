package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.QnABean;

public interface QnADAO {

	List<QnA> selectQnA();
	
	List<QnA> selectQnAByBean(QnABean qnABean);
	
	QnA selectQnAByNo(int qnaNo);

	boolean insertQnA(QnA qna);

	boolean updateQnA(QnA qna);

	boolean deleteQnA(int qnaNo);
}
