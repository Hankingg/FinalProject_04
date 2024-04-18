package com.kh.medicare.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class hospitalController {
	
	
	@RequestMapping("hospital.do")
	public String selectHospitalPage() {
		return "hospital/hospitalListModi";
	}
	
	
	
}
