package com.kh.medicare.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.medicare.hospital.model.service.HospitalService;
import com.kh.medicare.hospital.model.service.HospitalServiceImpl;
import com.kh.medicare.hospital.model.vo.Hospital;


@Controller
public class ApiController {
		
		private static final double RADIUS = 6371;
	
		@Autowired
		private HospitalServiceImpl hService;
	
		private static final String serviceKey = "34wsc6y766r8ksUWol03G06POGG5hfycBII2oLzjGnQ1I5%2BEugxDjmCgVqWv3l0QPP1XvzaaNNBdfWdwSuv8EA%3D%3D";
	
		@ResponseBody
		@RequestMapping(value="hospital.in", produces = "text/xml; charset=UTF-8")
		public String hospitalInfo(String Q1,String QD,String QN) throws IOException {
			String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
			url += "?serviceKey=" + serviceKey;
			url += "&Q1=" + URLEncoder.encode(Q1, "UTF-8");
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
			
			br.close();
			urlConnection.disconnect();
			return responseText;
			
		}
		
		@ResponseBody
		@RequestMapping(value="nearhos.in", produces = "application/json; charset=UTF-8")
		public String nearHosInfo(String Q1,String QD,String QN, Model model) throws IOException {
			String url = "https://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
			url += "?serviceKey=" + serviceKey;
			url += "&Q0=" + URLEncoder.encode("서울특별시", "UTF-8");
			url += "&Q1=" + URLEncoder.encode(Q1, "UTF-8");
			url += "&QD=" + QD;
			url += "&QN=" + URLEncoder.encode(QN, "UTF-8");
			url += "&ORD=NAME";
			url += "&pageNo=1";
			url += "&numOfRows=10";
			System.out.println(url);
			URL requestUrl = new URL(url);
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			urlConnection.setRequestMethod("GET");
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			double wgs84Lat = 37.4989913;
			double wgs84Lon = 127.03282;
			
			String responseText = "";
			String line;
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			System.out.println(responseText);
			
			br.close();
			urlConnection.disconnect();
			
			ArrayList<Hospital> list = new ArrayList<Hospital>();
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			try {
			    DocumentBuilder builder = factory.newDocumentBuilder();
			    Document doc = builder.parse(new InputSource(new StringReader(responseText)));

			    NodeList itemList = doc.getElementsByTagName("item");
			    for (int i = 0; i < itemList.getLength(); i++) {
			        Node itemNode = itemList.item(i);
			        Hospital h = new Hospital();
			        if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
			            Element itemElement = (Element) itemNode;
			            String hpid = itemElement.getElementsByTagName("hpid").item(0).getTextContent();
			            String dutyName = itemElement.getElementsByTagName("dutyName").item(0).getTextContent();
			            String dutyAddr = itemElement.getElementsByTagName("dutyAddr").item(0).getTextContent(); 
			            double Dwgs84Lat = Double.parseDouble(itemElement.getElementsByTagName("wgs84Lat").item(0).getTextContent());
			            double Dwgs84Lon = Double.parseDouble(itemElement.getElementsByTagName("wgs84Lon").item(0).getTextContent()); 
			            System.out.println(Dwgs84Lat);
			            System.out.println(Dwgs84Lon);
			            
			            double deltaLat = Math.toRadians(Dwgs84Lat - wgs84Lat);
			            double deltaLon = Math.toRadians(Dwgs84Lon - wgs84Lon);
			            
			            

			            double a = Math.pow(Math.sin(deltaLat / 2), 2) +
			                    Math.cos(Math.toRadians(wgs84Lat)) * Math.cos(Math.toRadians(Dwgs84Lat)) *
			                    Math.pow(Math.sin(deltaLon / 2), 2);
			            double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
			            
			            double distanceKm = RADIUS * c;
			            int distanceMeters = (int)(distanceKm * 1000);
			            System.out.println(distanceMeters);
			            h.setHosCode(hpid);
			            h.setHosName(dutyName);
			            h.setHosAddress(dutyAddr);
			            h.setDistance(distanceMeters);
			            h.setHosLatitude(Dwgs84Lat);
			            h.setHosLongitude(Dwgs84Lon);
			            list.add(h);
			            
			            
			            
			        }
			    }
			    
			    // Collections.sort(list, Comparator.comparingInt(Hospital::getDistance));
			    
			} catch (Exception e) {
			    e.printStackTrace();
			}
			
			
			return new Gson().toJson(list); 
		}
    
}