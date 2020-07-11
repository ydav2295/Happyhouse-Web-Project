package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.Member;

public interface MemberService {
	boolean signUp(Member m);
	Member signIn(Member m);
	void updateMember(Member member);
	void deleteMember(String id);
	public Member searchPwd(Member member);
	public Member searchById(Member member);
}
