package com.kh.medicare.member.model.service;

import com.kh.medicare.member.model.vo.Member;

public interface MemberService  {

	int insertMember(Member m);
	
	Member loginMember(Member m);
	
	Member kakaoLogin(Member m);
	
} // Class
