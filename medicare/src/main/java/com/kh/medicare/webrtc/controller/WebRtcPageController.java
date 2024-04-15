package com.kh.medicare.webrtc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebRtcPageController {
	
	@RequestMapping("webrtc.go")
	public String webrtcPage() {
		return "hospital/webrtcPage";
	}
	
}
