package com.kh.medicare.api.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.kh.medicare.api.model.vo.Api;

@Controller
public class ApiController {
	
		private static String getTagValue(String tag, Element eElement) {
		    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		    Node nValue = (Node) nlList.item(0);
		    if(nValue == null) 
		        return null;
		    return nValue.getNodeValue();
		}
		
		@RequestMapping("api.in")
		public String getHostpitalInfo(Api a, Model model) {
			System.out.println(a);
		// 파싱 url 준비
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
        try {
            urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=34wsc6y766r8ksUWol03G06POGG5hfycBII2oLzjGnQ1I5%2BEugxDjmCgVqWv3l0QPP1XvzaaNNBdfWdwSuv8EA%3D%3D"); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(a.getQ0(), "UTF-8")); /*주소(시도)*/
            //urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode("강남구", "UTF-8")); /*주소(시군구)*/
            //urlBuilder.append("&" + URLEncoder.encode("QZ","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*CODE_MST의'H000' 참조(B:병원, C:의원)*/
            //urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("D001", "UTF-8")); /*CODE_MST의'D000' 참조(D001~D029)*/
            //urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일(1~7), 공휴일(8)*/
            urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode(a.getQn(), "UTF-8")); /*기관명*/
            urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
            urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
            urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            
            // 페이지에 접근해줄 Document객체 생성
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(conn.getInputStream());
            doc.getDocumentElement().normalize();
            System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // 최상위 tag 나옴
            
            // 파싱할 정보가 있는 tag에 접근
            NodeList nList = doc.getElementsByTagName("response");
            System.out.println("파싱할 리스트 수 : "+ nList.getLength());
            
            // list에 담긴 데이터 출력하기
            for(int temp = 0; temp < nList.getLength(); temp++){		
            	Node nNode = nList.item(temp);
            	if(nNode.getNodeType() == Node.ELEMENT_NODE){
            						
            		Element eElement = (Element) nNode;
            		System.out.println("######################");
            		//System.out.println(eElement.getTextContent());
            		System.out.println("병원이름  : " + getTagValue("dutyName", eElement));
            		System.out.println("기관 코드  : " + getTagValue("hpid", eElement));
            		System.out.println("병원 주소 : " + getTagValue("dutyAddr", eElement));
            		System.out.println("진료 과목  : " + getTagValue("dutyEmcls", eElement));
            		System.out.println("병원 부서 정보  : " + getTagValue("dutyDivNam", eElement));
            		
            		model.addAttribute("dutyName",getTagValue("dutyName", eElement));
            		model.addAttribute("hpid", getTagValue("hpid", eElement));
            		model.addAttribute("dutyAddr", getTagValue("dutyAddr", eElement));
            		model.addAttribute("dutyEmcls", getTagValue("dutyEmcls", eElement));
            		model.addAttribute("dutyDivNam", getTagValue("dutyDivNam", eElement));
            	}	// for end
            }	// if end
            
            conn.disconnect();
            
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
        return "main";
	}
    
}