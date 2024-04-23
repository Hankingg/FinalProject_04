package com.kh.medicare.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medicare.hospital.model.service.HospitalService;
import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Review;

@Controller
public class hospitalController {
	
	@Autowired
	private HospitalService hService;
	
	@RequestMapping("hosDetail.go")
	public String goHospital(String hpid,int distance, String dot,HttpSession session) {
		Hospital h = hService.selectHospitalInfo(hpid);
			session.setAttribute("h", h);
			session.setAttribute("distance", distance);
			session.setAttribute("dot", dot);
			return "hospital/hospitalDetail";
	}
	
	@RequestMapping("hospital.do")
	public String selectHospitalPage() {
		return "hospital/hospitalListModi";
	}
	
	@ResponseBody
	@RequestMapping(value="review.in", produces = "application/json; charset=utf-8")
	public String insertReview(Review r,HttpSession session, HttpServletResponse response) throws IOException {
		int result = hService.insertReview(r);
		if(result > 0) {
			ArrayList<Review> list = hService.selectReviewList(r);
			return new Gson().toJson(list); 
		}else {
			session.setAttribute("errorMsg", "리뷰등록실패");
			return "common/errorPage";
		}
		
	}
		
	@ResponseBody
	@RequestMapping(value="review.get", produces = "application/json; charset=utf-8")
	public String getReview(Review r) {
		ArrayList<Review> list = hService.selectReviewList(r);
		return new Gson().toJson(list); 
	}
		
	@RequestMapping("order.go")
	public String orderPage() {
		return "hospital/order";
	}
	
	@RequestMapping("documentPage.in")
	public String documentPage() {
		return "hospital/documentPage";
	}
	
}
