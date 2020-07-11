package com.ssafy.happyhouse.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.InterestedOpt;
@Repository
public class InterestedOptDAOImpl implements InterestedOptDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.InterestedOptDAO.";
	@Autowired
	SqlSession sqlsession;
	@Override
	public boolean insertInterestedOpt(InterestedOpt interestedOpt) {
		System.out.println("daoInsert : "+ interestedOpt);
		if(sqlsession.insert(NS+"insertInterestedOpt",interestedOpt) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean updateInterestedOpt(InterestedOpt interestedOpt) {
		if(sqlsession.update(NS+"updateInterestedOpt",interestedOpt) == 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteInterestedOpt(String id) {
		if(sqlsession.delete(NS+"deleteInterestedOpt",id) == 0){
			return false;
		}
		return true;
	}

	@Override
	public InterestedOpt selectInterestedOptByID(String id) {
		return sqlsession.selectOne(NS+"selectInterestedOptByID",id);
	}

}
