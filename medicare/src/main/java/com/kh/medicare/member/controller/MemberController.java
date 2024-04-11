package com.kh.medicare.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medicare.member.model.service.MemberServiceImpl;
import com.kh.medicare.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		// /WEB-INF/views/		member/memberEnrollForm.jsp 포워딩
		return "member/memberEnrollForm";
		
	} // enrollForm
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());

		m.setMemPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) { 			
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			return "main";		
		} else { 
			model.addAttribute("errormsg", "회원가입 실패");
			return "common/errorPage";
		}
		
		 
	} // insertMember
	
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	} // myPage
	
	
	@RequestMapping("login.me")
	public String loginPage() {
		
		return "member/login";
	} // loginPage
	
	
	
} //Class
