package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.QnADAO;
import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.QnABean;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		// TODO Auto-generated method stub
		return dao.selectQnA();
	}

	@Override
	public QnA detailQnA(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.selectQnAByNo(qnaNo);
	}

	@Override
	public boolean writeQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.insertQnA(qna);
	}

	@Override
	public boolean updateQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateQnA(qna);
	}

	@Override
	public boolean deleteQnA(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteQnA(qnaNo);
	}

	@Override
	public List<QnA> retrieveQnAByBean(QnABean qnABean) {
		// TODO Auto-generated method stub
		return dao.selectQnAByBean(qnABean);
	}

}
