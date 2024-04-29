package com.kh.medicare.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WeatherController {
	
	private static final String serviceKey = "nLhHeLPzVGZH0bvIiEZjRSBa00JzdsLVTEDO%2BTyhwhjKNB94zP5Q8sM5IavINwEogJAPHHE85bhGLlUqBbjiLA%3D%3D";
	
	@ResponseBody
	@RequestMapping(value="list.wt", produces = "text/xml; charset=utf-8")
	public String kHospital() throws IOException {
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		url += "?serviceKey=" + serviceKey;
		url += "&pageNo=1";
		url += "&numOfRows=50";
		url += "&dataType=xml";
		url += "&base_date=20240425";
		url += "&base_time=1700";
		url += "&nx=61";
		url += "&ny=125";
		
		
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
	
	@ResponseBody
	@RequestMapping(value="air.do", produces = "text/xml; charset=utf-8")
	public String airPollution() throws IOException {
		
		String url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
		url += "?serviceKey=" + serviceKey;
		url += "&sidoName=" + URLEncoder.encode("서울", "UTF-8");
		url += "&returnType=xml";
		url += "&numOfRows=50";
		
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
