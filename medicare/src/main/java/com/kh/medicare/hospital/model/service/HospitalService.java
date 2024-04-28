package com.kh.medicare.hospital.model.service;

import java.util.ArrayList;
import java.util.Date;

import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Order;
import com.kh.medicare.hospital.model.vo.Review;

public interface HospitalService {
	
	Hospital selectHospitalInfo(String hpid);
	
	int insertReview(Review r);
	
	ArrayList<Review> selectReviewList(Review r);

	ArrayList<Review> selectMyReviewList(int memNo);
	
	int insertOrder(Order order);
	
}
