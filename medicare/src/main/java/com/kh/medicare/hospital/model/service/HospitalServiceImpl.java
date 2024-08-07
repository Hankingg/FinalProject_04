package com.kh.medicare.hospital.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.hospital.model.dao.HospitalDao;
import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Order;
import com.kh.medicare.hospital.model.vo.Review;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private HospitalDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Hospital selectHospitalInfo(String hpid) {
		return hDao.selectHospitalInfo(sqlSession,hpid);
	}

	@Override
	public int insertReview(Review r) {
		return hDao.insertReview(sqlSession, r);
	}

	@Override
	public ArrayList<Review> selectReviewList(Review r) {
		return hDao.selectReviewList(sqlSession, r);
	}

	@Override
	public ArrayList<Review> selectMyReviewList(Map<String, Object> memInfo) {
		return hDao.selectMyReviewList(sqlSession, memInfo);
	}

	@Override
	public int insertOrder(Order order) {
		return hDao.insertOrder(sqlSession,order);
	}

	@Override
	public ArrayList<Review> reviewGraph(String hosCode) {
		return hDao.reviewGraph(sqlSession,hosCode);
	}

	@Override
	public int deleteReview(int revNo) {
		return hDao.deleteReview(sqlSession, revNo);
	}

	@Override
	public Review selectReviewAvg(String hpid) {
		return hDao.selectReviewAvg(sqlSession,hpid);
	}
}
