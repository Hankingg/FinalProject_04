package com.kh.medicare.calender.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.medicare.calender.model.service.CalenderService;
import com.kh.medicare.calender.model.vo.Calender;

@Controller
public class CalenderController {
	@Autowired(required = false)
	private CalenderService cService;

	@ResponseBody
	@RequestMapping(value= "/selectEventList")
	public ArrayList<Calender> calenList(Model model){
		ArrayList<Calender> list = cService.calenList();
		
		model.addAttribute("list",list);
		
		return list;
	}
	@ResponseBody
	@RequestMapping("order.complete")
	public int completeOrder(int memNo,Model model) {
		System.out.println(memNo);
		int result = cService.completeOrder(memNo);
		
		if(result > 0) {
			model.addAttribute("alertMsg","예약 완료");
			return result;
		}else {
			model.addAttribute("errorMsg","예약 실패");
			return result;
		}
	}
	@ResponseBody
	@RequestMapping("order.delete")
	public int deleteOrder(int memNo,Model model) {
		System.out.println("타냐");
		int result = cService.deleteOrder(memNo);
		
		if(result > 0) {
			model.addAttribute("alertMsg","예약 취소 완료");
			return result;
		}else {
			model.addAttribute("errorMsg","예약 취소 실패");
			return result;
		}
	}
	
}