package com.kh.medicare.delivery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medicare.delivery.model.service.DeliveryServiceImpl;
import com.kh.medicare.document.model.service.DocumentServiceImpl;
import com.kh.medicare.document.model.vo.Document;

@Controller
public class DeliveryController {

	@Autowired
	private DeliveryServiceImpl dlService;
	@Autowired
	private DocumentServiceImpl dcService;
	
	
	@RequestMapping(value="insert.dl")
	public String insertDelivery(int dcNo, HttpSession session, Model model) {
		
		Document document = dcService.selectDocument(dcNo);
		
		int result = dlService.insertDelivery(document);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "택배 발송이 완료되었습니다.");
			return "redirect:myPage.me";
		} else {
			model.addAttribute("errorMsg", "택배 발송을 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
}
