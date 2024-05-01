package com.kh.medicare.websocket.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController{
	
	/*
	@MessageMapping("/chat") // 클라이언트가 "/app/chat"로 메시지를 보내면
	@SendTo("/topic/messages") // 해당 경로로 메시지를 브로드캐스트합니다.
	public String handleChatMessage(String message) {
        return "상대: " + message; // 받은 메시지를 "상대:"라는 문자열과 함께 반환합니다.
    }
	*/
}
