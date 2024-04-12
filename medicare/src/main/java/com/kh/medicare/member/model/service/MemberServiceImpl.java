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
		
		Member kakaoUser = mDao.kakaoLogin(sqlSession, m);
		
		return kakaoUser;
		
	}
	
	

	

	
	
} // Class
