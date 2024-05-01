package com.kh.medicare.member.model.service;

import java.util.ArrayList;

import com.kh.medicare.common.model.vo.PageInfo;
import com.kh.medicare.member.model.vo.Member;



public interface MemberService  {
	
	int insertMember(Member m);
	
	Member loginMember(Member m);
	
	Member kakaoLogin(Member m);
	
	Member naverLogin(Member m);
	
	// 정보수정 서비스(update)
	int updateMember(Member m);
	
	int updateMembershipMonth(Member m);
	
	int updateMembershipYear(Member m);
	
	// 회원탈퇴 서비스(update)
	int deleteMember(String memId);
	
	int changePwd(Member m);
	
	int selectListCount();
	ArrayList<Member> adminSelectMem(PageInfo pi);
	ArrayList<Member> adminRestoreMem(PageInfo pi);

	int adminDeleteMember(int[] members);
	
	int adminRestoreMember(int[] members);
	
} // Class
