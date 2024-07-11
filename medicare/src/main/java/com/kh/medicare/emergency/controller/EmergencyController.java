package com.kh.medicare.emergency.controller;

import java.net.URLEncoder;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmergencyController {

private static final String serviceKey = "#";
	
	@ResponseBody
	@RequestMapping(value="emer.do", produces="text/xml; charset=UTF-8")
	public String Emergency(String location1, String location2) throws IOException {
		
		String url = "https://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire";
		url += "?serviceKey=" + serviceKey;		
		url += "&STAGE1=" + URLEncoder.encode(location1, "UTF-8");
		url += "&STAGE2=" + URLEncoder.encode(location2, "UTF-8");
		url += "&pageNo=1"; 
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
	
	} // Emergency	
	
	@RequestMapping("emergencyList.em")
	public String emergencyList() {
		
		return "emergency/emergencyList";
	
	} // emergencyList
	
	
	
	
	
} // Class
