package com.kh.medicare.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medicare.common.model.vo.PageInfo;
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
	public int selectListCount() {		
		
		return mDao.selectListCount(sqlSession);
		
	}
	
	@Override
	public ArrayList<Member> adminSelectMem(PageInfo pi) {

		return mDao.adminSelectMem(sqlSession, pi);
	}
	

	@Override
	public ArrayList<Member> adminRestoreMem(PageInfo pi) {

		return mDao.adminRestoreMem(sqlSession, pi);
	}
	
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}
	
	public int updateMembershipMonth(Member m) {
		int result = mDao.updateMembershipMonth(sqlSession, m);
		return result;
	}

	@Override
	public int deleteMember(String memId) {
		
		return mDao.deleteMember(sqlSession, memId);
	}

	@Override
	public int updateMembershipYear(Member m) {
		int result = mDao.updateMembershipYear(sqlSession, m);
		return result;
	}

	@Override
	public int changePwd(Member m) {
		int result = mDao.changePwd(sqlSession, m);
		return result;
	}

	@Override
	public int adminDeleteMember(int[] members) {
		int result = mDao.adminDeleteMember(sqlSession, members);
		return result;
	}

	@Override
	public int adminRestoreMember(int[] members) {
		int result = mDao.adminRestoreMember(sqlSession, members);
		return result;
	}

	

	

	

	

	

	
	
	

	

	
	
} // Class
