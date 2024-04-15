package com.kh.medicare.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.medicare.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	} // loginMember
	
	public int insertMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
		
	} // insertMember
	
	public Member kakaoLogin(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.kakaoLogin", m);
		
	} // kakaoLogin
	
} // Class
