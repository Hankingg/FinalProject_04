package com.kh.medicare.hospital.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.kh.medicare.hospital.model.service.HospitalService;
import com.kh.medicare.hospital.model.service.HospitalServiceImpl;
import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.hospital.model.vo.Order;
import com.kh.medicare.hospital.model.vo.Review;


@Controller
public class hospitalController {
	
	
	@Autowired
	private HospitalServiceImpl hService;
	
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
	public String orderPage(String hosCode, Model model) {
		Hospital h = hService.selectHospitalInfo(hosCode);
		model.addAttribute("h",h);
		return "hospital/order";
	}
	
	@ResponseBody
	@RequestMapping(value="myReview.rv", produces = "application/json; charset=utf-8")
	public String myReviewList(int memNo, String memId) {
		
		Map<String, Object> memInfo = new HashMap();
	    memInfo.put("memNo", memNo);
	    memInfo.put("memId", memId);
		ArrayList<Review> list = hService.selectMyReviewList(memInfo);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("order.in")
	public String insertOrder(Order order,Model model) {
		System.out.println(order);
			int result = hService.insertOrder(order);
		if(result > 0) {
			model.addAttribute("alertMsg","예약성공했습니다");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","예약에 성공하지못했습니다");
			return "redirect:/";
		}
	}
	
	@RequestMapping("doctorMyPage.in")
	public String goDoctorMyPage() {
		return "hospital/doctorMyPage";
	}
	
	@RequestMapping("calenderPage.in")
	public String goCalenderPage() {
		return "hospital/doctorPageSca";
	}
	
	@ResponseBody
	@RequestMapping(value="review.graph", produces = "application/json; charset=utf-8")
	public String reviewGraph(String hosCode){
		ArrayList<Review> list = hService.reviewGraph(hosCode);
		System.out.println(list);
		return new Gson().toJson(list);
	}
}
