package com.kh.medicare.calender.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medicare.calender.model.service.CalenderService;
import com.kh.medicare.calender.model.vo.Calender;
import com.kh.medicare.hospital.model.vo.Order;

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
	public int completeOrder(Order order,Model model) {
		System.out.println(order);
		int result = cService.completeOrder(order);
		
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
	public int deleteOrder(Order order,Model model) {
		System.out.println("타냐");
		System.out.println(order);
		int result = cService.deleteOrder(order);
		System.out.println("result : " + result);
		if(result > 0) {
			model.addAttribute("alertMsg","예약 취소 완료");
			return result;
		}else {
			model.addAttribute("errorMsg","예약 취소 실패");
			return result;
		}
	}
	
	@ResponseBody
	@RequestMapping("order.finish")
	public int finishOrder(Order order,Model model) {
		int result = cService.deleteOrder(order);
		
		if(result > 0) {
			return result;
		}else {
			return result;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="diagnosis.select", produces = "application/json; charset=utf-8")
	public String myDiagnosisInfo(int memNo, Model model){
		System.out.println("왔냐");
		ArrayList<Calender> list = cService.myDiagnosisInfo(memNo);
		System.out.println(list);
		model.addAttribute("list",list);
		
		return new Gson().toJson(list);
	}
	
}
