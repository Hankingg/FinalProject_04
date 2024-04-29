package com.kh.medicare.webrtc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medicare.member.model.vo.Member;

@Controller
public class WebRtcPageController {
	
	
	@RequestMapping("webrtcRoom.go")
	public String webrtcRoomPage(String memId,Model model) {
		model.addAttribute("memId",memId);
		return "hospital/hospitalDiaPage";
	}
	
	@RequestMapping("webrtc.go")
	public String webrtcPage(String memId,int roomNum, Model model) {
		
		model.addAttribute("memId",memId);
		model.addAttribute("roomNum", roomNum);
		return "hospital/webrtcPage";
	}
	
}
