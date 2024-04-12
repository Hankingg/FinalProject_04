package com.kh.medicare.member.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
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
	
	
	@RequestMapping("moveLoginPage.me")
	public String loginPage(HttpSession session ,HttpServletResponse response, HttpServletRequest request) {
		
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setMaxAge(0); // 쿠키의 유효기간을 0으로 설정하여 삭제합니다.
	            System.out.println("gdfjkgdfjhgdb");
	        }
	    }
		
		return "member/login";
	} // loginPage
	
	
	@RequestMapping("login.me") 
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);		
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {						
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");				
		} else {		
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");							
		}
			
		return mv;
		
	} // loginMember
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";	
		
	} //  logoutMember
	
	@RequestMapping("kakaoLogin.me")
	public void kakaoLogin(Member m, HttpSession session, Model model, HttpServletResponse response) throws IOException {
	    // 카카오에서 받아온 사용자 정보를 확인하여 이미 데이터베이스에 있는지 여부를 판단하고, 없는 경우 추가합니다.
	    Member loginUser = mService.kakaoLogin(m);
	    System.out.println(loginUser);
	    if (loginUser != null) {
	        // 이미 회원이 있는 경우 로그인 처리
	        session.setAttribute("loginUser", loginUser);
	        response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print("success");
	    } else {
	        // 회원이 없는 경우 새로 추가
	    	m.setMtId("M");
	        int result = mService.insertMember(m);
	        if (result > 0) {
	            // 회원 추가 성공 시 로그인 처리
	            session.setAttribute("loginUser", m);
	            response.setContentType("text/html; charset=UTF-8");
	            response.getWriter().print("success");            
	        } else {
	            // 회원 추가 실패 시 오류 처리
	            model.addAttribute("errorMsg", "회원 추가 실패");
	            response.setContentType("text/html; charset=UTF-8");
	            response.getWriter().print("fail");
	        }
	    }
	    // 메인 페이지로 리다이렉트
	     
	}
	
	
	
	
	@RequestMapping("enrollForm.dv")
	public String deliveryEnrollForm() {
		return "member/deliveryEnrollForm";
	}
	
} //Class
