package com.kh.medicare.emergency.controller;

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
public class EmergencyLiveLoadController {
	
		private static final String key = "";
		
		
	    @ResponseBody
	    @RequestMapping(value="emLive.em", produces="text/xml; charset=UTF-8")
	    public String loadLive() throws IOException {
		  
	    	String url = "http://www.utic.go.kr/etc/telMap.do";
	    	url += "?key=" + key;
	    	   	
	    	
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
	    	
	  } // loadLive
	    
	   
	
	
	
} // Class
