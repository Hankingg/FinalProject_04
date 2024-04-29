package com.kh.medicare.hospital.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Order;
import com.kh.medicare.hospital.model.vo.Review;

public interface HospitalService {
	
	Hospital selectHospitalInfo(String hpid);
	
	int insertReview(Review r);
	
	ArrayList<Review> selectReviewList(Review r);

	ArrayList<Review> selectMyReviewList(Map<String, Object> memInfo);
	
	int insertOrder(Order order);
	
	int deleteReview(int revNo);
	
}
