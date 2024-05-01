package com.kh.medicare.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.hospital.model.vo.Review;
import com.kh.medicare.common.model.vo.PageInfo;
import com.kh.medicare.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	} // loginMember
	
	public int selectListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectListCount");
		
	} // selectListCount
	
	public ArrayList<Member> adminSelectMem(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.adminSelectMember", null, rowBounds);
		
	} // adminSelectMem
	
	
	public ArrayList<Member> adminRestoreMem(SqlSession sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.adminRestoreMem", null, rowBounds);
		
	} // adminSelectMem
	
	public int insertMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
		
	} // insertMember
	
	public Member kakaoLogin(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.kakaoLogin", m);
		
	} // kakaoLogin
	
	public Member naverLogin(SqlSession sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.naverLogin", m);
		
	} // naverLogin
	
	public int updateMembershipMonth(SqlSession sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMembershipMonth", m);
		
	} // updateMembership
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int adminDeleteMember(SqlSessionTemplate sqlSession, int[] members) {
		
		return sqlSession.update("memberMapper.adminDeleteMember", members);
		
	}
	
	public int adminRestoreMember(SqlSessionTemplate sqlSession, int[] members) {
		
		return sqlSession.update("memberMapper.adminRestoreMember", members);
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String memId) {
		
		return sqlSession.update("memberMapper.deleteMember", memId);
	}
		
	public int updateMembershipYear(SqlSession sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMembershipYear", m);
		
	} // updateMembership
	
	public int changePwd(SqlSession sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.changePwd", m);
		
	} // changPwd
	
} // Class
