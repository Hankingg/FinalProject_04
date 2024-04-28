package com.kh.medicare.webrtc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebRtcPageController {
	
	@RequestMapping("webrtcRoom.go")
	public String webrtcRoomPage(int memNo,Model model) {
		model.addAttribute("memNo",memNo);
		return "hospital/hospitalDiaPage";
	}
	
	@RequestMapping("webrtc.go")
	public String webrtcPage(int memNo,int roomNum, Model model) {
		
		model.addAttribute("memNo",memNo);
		model.addAttribute("roomNum", roomNum);
		return "hospital/webrtcPage";
	}
	
}
