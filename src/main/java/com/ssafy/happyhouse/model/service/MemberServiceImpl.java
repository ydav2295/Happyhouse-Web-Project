package com.ssafy.happyhouse.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.MemberDAO;
import com.ssafy.happyhouse.model.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;

	@Override
	public boolean signUp(Member m){
		// TODO Auto-generated method stub
		return dao.insertMember(m);
	}

	@Override
	public Member signIn(Member m) {
		// TODO Auto-generated method stub
		return dao.login(m);
	}
	
	@Override
	public void updateMember(Member member) {
		// TODO Auto-generated method stub
		dao.updateMember(member);
		
	}

	@Override
	public void deleteMember(String id){
		dao.deleteMember(id);
		
	}
	@Override
	public Member searchPwd(Member member) {
		return dao.searchPwd(member);
	}
	@Override
	public Member searchById(Member member) {
		return dao.searchById(member);
	}
}
