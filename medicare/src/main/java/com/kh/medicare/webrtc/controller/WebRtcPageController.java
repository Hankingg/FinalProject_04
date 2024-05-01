package com.kh.medicare.webrtc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medicare.hospital.model.service.HospitalServiceImpl;
import com.kh.medicare.hospital.model.vo.Hospital;
import com.kh.medicare.member.model.service.MemberServiceImpl;
import com.kh.medicare.member.model.vo.Member;

@Controller
public class WebRtcPageController {
	
	@Autowired
	private HospitalServiceImpl hService;
	
	@Autowired
	private MemberServiceImpl mService;
	
	@RequestMapping("webrtcRoom.go")
	public String webrtcRoomPage(String memId,String hosCode,Model model) {
		System.out.println(hosCode);
		Hospital h = hService.selectHospitalInfo(hosCode);
		System.out.println("hospital:"+h);
		model.addAttribute("memId",memId);
		model.addAttribute("h",h);
		return "hospital/hospitalDiaPage";
	}
	
	@RequestMapping("webrtc.go")
	public String webrtcPage(Member memId,int roomNum,String hosCode, Model model) {
		Member loginUser = mService.loginMember(memId);
		
		model.addAttribute("hosCode", hosCode);
		model.addAttribute("memNo",loginUser.getMemNo());
		model.addAttribute("memId",loginUser.getMemId());
		model.addAttribute("roomNum", roomNum);
		return "hospital/webrtcPage";
	}
	
	
}
