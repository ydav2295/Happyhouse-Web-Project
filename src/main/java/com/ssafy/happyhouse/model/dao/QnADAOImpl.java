package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.dto.QnABean;
@Repository
public class QnADAOImpl implements QnADAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.QnADAO.";
	@Autowired
	SqlSession sqlsession;
	@Override
	public List<QnA> selectQnA() {
		return sqlsession.selectList(NS+"selectQnA");
	}

	@Override
	public QnA selectQnAByNo(int qnaNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NS+"selectQnAByNo",qnaNo);
	}

	@Override
	public boolean insertQnA(QnA qna) {
		System.out.println("insertQnA : "+ qna);
		if(sqlsession.insert(NS+"insertQnA",qna) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean updateQnA(QnA qna) {
		System.out.println("updateQnA : "+ qna);
		if(sqlsession.update(NS+"updateQnA",qna) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteQnA(int qnaNo) {
		if(sqlsession.delete(NS+"deleteQnA",qnaNo) == 0){
			return false;
		}
		return true;
	}

	@Override
	public List<QnA> selectQnAByBean(QnABean qnABean) {
		// TODO Auto-generated method stub
		qnABean.setSearchType(qnABean.getSearchType().trim());
		qnABean.setValue(qnABean.getValue().trim());
		System.out.println("DAO :" + qnABean);
		return sqlsession.selectList(NS+"selectQnAByBean",qnABean);
	}

}
