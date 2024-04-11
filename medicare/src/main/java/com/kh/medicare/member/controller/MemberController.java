package com.kh.medicare.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("login.me")
	public String loginPage() {
		
		
		
		
		return "member/login";
	}
	
	@RequestMapping("enrollForm.dv")
	public String deliveryEnrollForm() {
		return "member/deliveryEnrollForm";
	}
	
} //Class
