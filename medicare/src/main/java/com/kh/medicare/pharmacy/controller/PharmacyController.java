package com.kh.medicare.pharmacy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PharmacyController {

	@RequestMapping(value="selectList.ph")
	public String selectPharmacyList() {
		
		return "pharmacy/pharmacyList";
	} // 약국 리스트 조회
	
	@RequestMapping(value="selectList.md")
	public String selectMedicine() {
		
		return "pharmacy/medicineList";
	} // 의약품 리스트 조회
	
	@RequestMapping(value="selectDetail.ph")
	public String selectPharmacyDetail() {
		
		return "pharmacy/pharmacyDetail";
	} // 약국 상세페이지 조회
	
}
