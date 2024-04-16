package com.kh.medicare.kHospital.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KhospitalController {

	private static final String serviceKey = "nLhHeLPzVGZH0bvIiEZjRSBa00JzdsLVTEDO%2BTyhwhjKNB94zP5Q8sM5IavINwEogJAPHHE85bhGLlUqBbjiLA%3D%3D";
	
	// 한의원 목록페이지로 이동
	@RequestMapping("list.kh")
	public String kHospitalList() throws IOException {
		
		return "kHospital/kHospitalListView";
	}
	
	// 한의원목록 조회
	@ResponseBody
	@RequestMapping(value="selectList.kh", produces = "text/xml; charset=utf-8")
	public String kHospital() throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
		url += "?serviceKey=" + serviceKey;
		url += "&Q0=" + URLEncoder.encode("서울특별시", "UTF-8");
		url += "&QN=" + URLEncoder.encode("한의원", "UTF-8");
		url += "&numOfRows=20";
		
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
	
	// 한의원 상세페이지로 이동
	@ResponseBody
	@RequestMapping(value="detail.kh", produces = "text/xml; charset=utf-8")
	public ModelAndView kHospitalDetail(String hpid, ModelAndView mv) throws IOException {
		
		mv.addObject("hpid", hpid).setViewName("kHospital/kHospitalDetailView");
		return mv;
	}
	
	// 한의원 상세정보 조회
	@ResponseBody
	@RequestMapping(value="selectDetailInfo.kh", produces = "text/xml; charset=utf-8")
	public String selectDetailInfo(String hpid) throws IOException {
		
		String url = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire";
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
	
	
}
