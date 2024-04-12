package com.kh.medicare.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.kh.medicare.api.model.vo.Api;

@Controller
public class ApiController {
		
		private static final String serviceKey = "34wsc6y766r8ksUWol03G06POGG5hfycBII2oLzjGnQ1I5%2BEugxDjmCgVqWv3l0QPP1XvzaaNNBdfWdwSuv8EA%3D%3D";
	
		@ResponseBody
		@RequestMapping(value="hospital.in", produces = "text/xml; charset=UTF-8")
		public String hospitalInfo(String Q0,String QD,String QN) throws IOException {
			System.out.println(Q0);
			System.out.println(QD);
			String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
			url += "?serviceKey=" + serviceKey;
			url += "&Q0=" + URLEncoder.encode(Q0, "UTF-8");
			url += "&QD=" + QD;
			url += "&QN=" + URLEncoder.encode(QN, "UTF-8");
			url += "&ORD=NAME";
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
			System.out.println(responseText);
			
			br.close();
			urlConnection.disconnect();
			return responseText;
			
		}
    
}