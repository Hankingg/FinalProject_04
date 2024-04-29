package com.kh.medicare.emergency.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmergencyUserHospitalController {

	private static final String serviceKey = "YpWfxXHIJ%2Br47HRPOcTmmYXIn8QipimYeIn4NoAHIGg4of5Lohy7taToY2ecMf7mFZEdgzlTLPWR0Br895FXXw%3D%3D";
	
	@ResponseBody
	@RequestMapping(value="hospitalInfo.em", produces = "text/xml; charset=UTF-8")
	public String nearHosInfo(String hpid) throws IOException {
		
		  String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire";
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
	
} // Class
