package com.kh.medicare.hospital.model.dao;

import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Order;
import com.kh.medicare.hospital.model.vo.Review;

@Repository
public class HospitalDao {
	
	public Hospital selectHospitalInfo(SqlSessionTemplate sqlSession, String hpid) {
		return sqlSession.selectOne("hospitalMapper.selectHospitalInfo",hpid);
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("hospitalMapper.insertReview", r);
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,Review r){
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectReviewList", r);
	}

	public ArrayList<Review> selectMyReviewList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectMyReviewList", memNo);
	}
	
	public int insertOrder(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("hospitalMapper.insertOrder", order);
	}
	
	
}
