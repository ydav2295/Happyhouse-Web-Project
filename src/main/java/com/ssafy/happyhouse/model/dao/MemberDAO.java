package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.Member;

public interface MemberDAO {
	boolean insertMember(Member member) ;
	Member login(Member m);
	void updateMember(Member member);
	void deleteMember(String id);
	Member searchPwd(Member member);
	Member searchById(Member member);
}
