package com.kh.medicare.member.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Controller
@ServerEndpoint("/HInfoChat")
public class HInfoChattingServer {
    
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static HashMap<String, String> clientSessionMap = new HashMap<String, String>();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("채팅방 입장: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException, ParseException {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);
        synchronized (clients) {
            JSONParser parser = new JSONParser();
            Object obj = parser.parse(message);
            JSONObject jObj = (JSONObject)obj;
            
            String type = (String)jObj.get("type");
            String sender = (String)jObj.get("sender");
            
            if (type.equals("CHAT")) {
                if (!hasWhisper(session, message)) {
                    broadcast(message);
                }
            } else if (type.equals("COMMAND")) {
                clientSessionMap.put(session.getId(), sender);
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        clientSessionMap.remove(session.getId());
        System.out.println("웹소켓 종료: " + session.getId());
    }

    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }

    private Boolean hasWhisper(Session session, String originMessage) throws IOException, ParseException {
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(originMessage);
       JSONObject jObj = (JSONObject)obj;
       String sender = (String)jObj.get("sender");
       String message = (String)jObj.get("content");
    
       // 3.17 정규식을 이용해서 귓속말 member id가 있는지 확인
       String regEx = "[@]+([a-zA-Z]{1}[a-zA-Z0-9]*)[\\ ]+";
       Pattern pattern = Pattern.compile(regEx);
       Matcher matcher = pattern.matcher(message);
       
       ArrayList<String> memberIds = new ArrayList<String>();
       while (matcher.find()) {
          String matchStr = matcher.group(0);
          String memberId = matcher.group(1);
          
          message = message.replaceAll(matchStr, "");
          memberIds.add(memberId);
       }
       
       if (memberIds.size() > 0) {
          String whisperReceiver = new String(memberIds.toString());
          System.out.println(whisperReceiver);
           whisperReceiver = whisperReceiver.replaceAll("\\[", "");
           whisperReceiver = whisperReceiver.replaceAll("\\]",  "");
           
           jObj.remove("type");
           jObj.remove("content");
           jObj.put("type", "WHISPER");
           jObj.put("content", message);
           jObj.put("whisperReceiver", whisperReceiver);
          
          for (Session client : clients) {
             if (memberIds.contains(clientSessionMap.get(client.getId())) ||
                session.getId() == client.getId()) {
                client.getBasicRemote().sendText(jObj.toJSONString());
             }
            }
          
          return true;
       }
       
       return false;
    }
    
    private void broadcast(String message) throws IOException {
        for (Session client : clients) {
            client.getBasicRemote().sendText(message);
        }
    }
}