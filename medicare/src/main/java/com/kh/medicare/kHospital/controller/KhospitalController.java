package com.kh.medicare.kHospital.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.internal.org.jline.utils.InputStreamReader;

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
	
	@ResponseBody
	@RequestMapping(value="list.kh", produces = "text/xml; charset=utf-8")
	public String kHospital(String location) throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
		url += "?serviceKey=" + serviceKey;
		url += "&Q0=" + URLEncoder.encode("서울특별시", "UTF-8");
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
