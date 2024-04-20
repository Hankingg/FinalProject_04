package com.kh.medicare.membership.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.member.model.service.MemberService;
import com.kh.medicare.membership.model.dao.MembershipDao;
import com.kh.medicare.membership.model.vo.Membership;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipDao msDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	

}
