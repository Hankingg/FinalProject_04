package com.kh.medicare.kHospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KhospitalController {

	@RequestMapping("selectList.kh")
	public String selectKhospitalList() {
		return "kHospital/kHospitalListView";
	}
	
	@RequestMapping("detail.kh")
	public String selectKhospitalDetail() {
		return "kHospital/kHospitalDetailView";
	}
}
