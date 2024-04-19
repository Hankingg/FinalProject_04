package com.kh.medicare.hospital.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medicare.hospital.model.service.HospitalService;
import com.kh.medicare.hospital.model.vo.Hospital;

@Controller
public class hospitalDetailController {
	
	@Autowired
	private HospitalService hService;
	
	@RequestMapping("hosDetail.go")
	public String goHospital(String hpid,HttpSession session) {
		System.out.println(hpid);
		Hospital h = hService.selectHospitalInfo(hpid);
		System.out.println(h);
			session.setAttribute("hospital", h);
			return "hospital/hospitalDetail";
	}
	
	
}
