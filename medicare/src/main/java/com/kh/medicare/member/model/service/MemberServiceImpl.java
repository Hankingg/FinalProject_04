package com.kh.medicare.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.member.model.dao.MemberDao;
import com.kh.medicare.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.loginMember(sqlSession, m);
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(sqlSession, m);
		return result;
	}

	@Override
	public Member kakaoLogin(Member m) {// TODO Auto-generated method stub
		
		Member loginUser = mDao.kakaoLogin(sqlSession, m);
		
		return loginUser;
		
	}

	@Override
	public Member naverLogin(Member m) {
		
		Member loginUser = mDao.naverLogin(sqlSession, m);
		
		return loginUser;
	}

	@Override
	public int updateMembershipMonth(Member m) {
		int result = mDao.updateMembershipMonth(sqlSession, m);
		return result;
	}

	
	
	

	

	
	
} // Class
