package com.kh.medicare.delivery.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medicare.delivery.model.service.DeliveryServiceImpl;
import com.kh.medicare.delivery.model.vo.Delivery;
import com.kh.medicare.document.model.service.DocumentServiceImpl;
import com.kh.medicare.document.model.vo.Document;

@Controller
public class DeliveryController {

	@Autowired
	private DeliveryServiceImpl dlService;
	@Autowired
	private DocumentServiceImpl dcService;
	
	@ResponseBody
	@RequestMapping(value="insert.dl")
	public String insertDelivery(int dcNo, String courier, String billingNo, HttpSession session, Model model) {
		
		Document document = dcService.selectDocument(dcNo);
		int result = dlService.insertDelivery(document, courier, billingNo); 
		
		int result2 = dcService.deleteDocument(dcNo);
		
		
		return result*result2 > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="selectList.dl", produces= "application/json; charset=UTF-8")
	public String selectListDelivery(int memNo) {
		
		ArrayList<Delivery> list = dlService.selectDeliveryList(memNo);
		
		return new Gson().toJson(list);
	}
	
	
	
	
}
