package com.ssafy.happyhouse.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Member;
@Repository
public class MemberDAOImpl implements MemberDAO {
	private final static String NS = "com.ssafy.happyhouse.model.dao.MemberDAO.";
	@Autowired
	SqlSession sqlsession;
	@Override
	public boolean insertMember(Member m) {
		if(sqlsession.insert(NS+"insertMember",m) == 0){
			return false;
		}
		return true;
	}
	@Override
	public Member searchById(Member member) {
		return sqlsession.selectOne(NS+"searchById",member);
	}
	@Override
	public Member login(Member m) {
		return sqlsession.selectOne(NS+"login",m);
	}

	@Override
	public void updateMember(Member member) {
		sqlsession.update(NS+"updateMember",member);
	}

	@Override
	public void deleteMember(String id){
		sqlsession.delete(NS+"deleteMember",id);
		
	}

	@Override
	public Member searchPwd(Member member){
		return sqlsession.selectOne(NS+"searchPwd",member);
	}
	
	

}
