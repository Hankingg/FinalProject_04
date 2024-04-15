package com.kh.medicare.kHospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KhospitalController {

	private static final String serviceKey = "nLhHeLPzVGZH0bvIiEZjRSBa00JzdsLVTEDO%2BTyhwhjKNB94zP5Q8sM5IavINwEogJAPHHE85bhGLlUqBbjiLA%3D%3D";
	
	@RequestMapping("selectList.kh")
	public String selectKhospitalList() {
		return "kHospital/kHospitalListView";
	}
	
	@RequestMapping("detail.kh")
	public String selectKhospitalDetail() {
		return "kHospital/kHospitalDetailView";
	}
}
