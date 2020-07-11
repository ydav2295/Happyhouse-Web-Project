package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.ReplyBoard;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.ReplyDAO.";
	@Autowired
	SqlSession sqlsession;
	@Override
	public List<ReplyBoard> selectReplyBoardByQnANo(int qnaNo) {
		return sqlsession.selectList(NS+"selectReplyBoardByQnANo",qnaNo);
	}

	@Override
	public ReplyBoard selectReplyBoardByReplyNo(int replyNo) {
		// TODO Auto-generated method stub
				return sqlsession.selectOne(NS+"selectReplyBoardByReplyNo",replyNo);
	}

	@Override
	public boolean insertReplyBoard(ReplyBoard replyBoard) {
		if(sqlsession.insert(NS+"insertReplyBoard",replyBoard) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean updateReplyBoard(ReplyBoard replyBoard) {
		System.out.println("updateReplyBoard : "+ replyBoard);
		if(sqlsession.update(NS+"updateReplyBoard",replyBoard) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteReplyBoard(int replyNo) {
		if(sqlsession.delete(NS+"deleteReplyBoard",replyNo) == 0){
			return false;
		}
		return true;
	}

}
