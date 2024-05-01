package com.kh.medicare.websocket.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.medicare.member.model.vo.Member;

@RequestMapping("/medicare/chat")
public class WebSocketHandler extends TextWebSocketHandler {

    private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String senderId = getMemberId(session);
        if (senderId != null) {
            users.put(senderId, session);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String senderId = getMemberId(session);

        if (senderId != null) {
            String msg = message.getPayload();

            if (msg != null) {
                String[] strs = msg.split(",");
                if (strs != null && strs.length == 4) {
                    String hos = strs[0];
                    String target = strs[1];
                    String content = strs[2];
                    WebSocketSession targetSession = users.get(target);

                    if (targetSession != null) {
                        TextMessage tmpMsg = new TextMessage("[<" + hos + ">] " + content);
                        try {
                            targetSession.sendMessage(tmpMsg);
                        } catch (IOException e) {
                            // 에러 처리
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String senderId = getMemberId(session);
        if (senderId != null) {
            users.remove(senderId);
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        // 오류 로깅
        System.err.println("WebSocket 전송 오류 발생: " + exception.getMessage());

        // 클라이언트와의 연결 종료
        if (session.isOpen()) {
            session.close();
        }
    }

    private String getMemberId(WebSocketSession session) {
        Map<String, Object> httpSession = session.getAttributes();
        Member member = (Member) httpSession.get("loginUser");
        String memId = null;
        if (member != null) {
            memId = member.getMemId();
        }
        return memId;
    }
}
