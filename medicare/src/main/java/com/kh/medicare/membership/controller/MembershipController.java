package com.kh.medicare.membership.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medicare.member.model.service.MemberServiceImpl;
import com.kh.medicare.member.model.vo.Member;
import com.kh.medicare.membership.model.service.MembershipServiceImpl;
import com.kh.medicare.membership.model.vo.Membership;

@Controller
public class MembershipController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@RequestMapping("membership.me")
	public String moveMembership() {
		
		return "member/membership";
		
	} // moveMembership
	

	@RequestMapping("membership.mo")
	public String updateMembershipMonth(Member m, Model model, HttpSession session) {
		System.out.println(m);
		int result = mService.updateMembershipMonth(m);
		Member loginUser = mService.loginMember(m); 
		
		
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "월간 구독권 구매가 완료 되었습니다!");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "구입 실패");
			return "common/errorPage";
		}
		
	} // updateMembership
	
}
