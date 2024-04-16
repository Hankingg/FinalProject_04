package com.kh.medicare.pharmacy.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PharmacyController {
	
	private static final String serviceKey = "pNCWmkUMAcA3lgnlH2TQLZJiIjuL7U%2BRBtCVzEEDzSUUNNJj0ret29u%2BISuTUyOsb67C7sUwm95m%2FWL34lyXAQ%3D%3D";

	// 약국 리스트 조회
	@RequestMapping(value="selectList.ph")
	public String selectPharmacyList() {
		
		return "pharmacy/pharmacyList";
	} 
	
	// 의약품 리스트 조회
	@RequestMapping(value="selectList.md")
	public String selectMedicine() {
		
		return "pharmacy/medicineList";
	} 
	
	// 약국 상세페이지 조회
	@RequestMapping(value="selectDetail.ph", produces="text/xml; charset=UTF-8")
	public String selectPharmacyDetail(String hpid, Model model) throws IOException {
		
		System.out.println(hpid);
		
		model.addAttribute("hpid", hpid);
		return "pharmacy/pharmacyDetail";
	} 
	
	// 약국 상세페이지 정보 뿌려주기
	@ResponseBody
	@RequestMapping(value="selectDetailInfo.ph", produces="text/xml; charset=UTF-8")
	public String SelectPharmacyDetailInfo(String hpid) throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyBassInfoInqire";
			   url += "?serviceKey=" + serviceKey;
			   url += "&HPID=" + hpid;
  
	
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line = br.readLine()) != null) {
			   responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
			
		return responseText;
	}
	
	
	// 약국 리스트페이지 조회
	@ResponseBody
	@RequestMapping(value="pharmacyListAPI.do", produces="text/xml; charset=UTF-8")
	public String pharmacyInfo(String Q1, String QN) throws IOException {
		
		if(Q1.equals("전체") || Q1.equals("지역 선택")) {
			Q1 = "";
		}
		
		String url = "https://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire";
			   url += "?serviceKey=" + serviceKey;
			   url += "&Q0=" + URLEncoder.encode("서울특별시");
			   url += "&Q1=" + URLEncoder.encode(Q1, "UTF-8");
			   url += "&QN=" + URLEncoder.encode(QN, "UTF-8");
			   url += "&numOfRows=10"; 	   

	   URL requestUrl = new URL(url);
       HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
       urlConnection.setRequestMethod("GET");
       
       BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

       String responseText = "";
       String line;
       while((line = br.readLine()) != null) {
    	   responseText += line;
       }
       
       br.close();
       urlConnection.disconnect();
		
       return responseText;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
