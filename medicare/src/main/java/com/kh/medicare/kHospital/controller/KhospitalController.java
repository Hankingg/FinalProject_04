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
	
	@RequestMapping(value="selectList.kh", produces = "text/xml; charset=utf-8")
	public ModelAndView selectKhospitalList(ModelAndView mv) throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
		url += "?serviceKey=" + serviceKey;
		url += "&Q0=" + URLEncoder.encode("서울특별시", "UTF-8");
		url += "&numOfRows=30";
		
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
		
		mv.addObject("responseText", responseText).setViewName("kHospital/kHospitalListView");
		
		return mv;
	}
	
	@RequestMapping("detail.kh")
	public String selectKhospitalDetail() {
		return "kHospital/kHospitalDetailView";
	}
	
	@ResponseBody
	@RequestMapping(value="list.kh", produces = "text/xml; charset=utf-8")
	public String kHospital(String location) throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
		url += "?serviceKey=" + serviceKey;
		url += "&Q0=" + URLEncoder.encode("서울특별시", "UTF-8");
		url += "&Q1=" + URLEncoder.encode(location, "UTF-8");
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
}
