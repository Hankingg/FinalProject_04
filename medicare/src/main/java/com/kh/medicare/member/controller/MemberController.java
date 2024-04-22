package com.kh.medicare.member.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.medicare.member.model.service.MemberServiceImpl;
import com.kh.medicare.member.model.vo.Member;



@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
		
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
    
    
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
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
		 
	} // insertMember
	
	
	@RequestMapping("myPage.me")
	public String myPage() {

		return "member/myPage";
	} // myPage
	
	
	@RequestMapping("moveLoginPage.me")
	public String loginPage(HttpSession session ,HttpServletResponse response, HttpServletRequest request) {
		
		
		
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
	   
	    Member loginUser = mService.kakaoLogin(m);
	    
	    if (loginUser != null) {
	      
	        session.setAttribute("loginUser", loginUser);
	        response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print("success");
	    } else {
	    
	    	m.setMtId("M");
	        int result = mService.insertMember(m);
	        if (result > 0) {
	      
	            session.setAttribute("loginUser", m);
	            response.setContentType("text/html; charset=UTF-8");
	            response.getWriter().print("success");            
	        } else {
	 
	            model.addAttribute("errorMsg", "회원 추가 실패");
	            response.setContentType("text/html; charset=UTF-8");
	            response.getWriter().print("fail");
	        }
	    }
	    // 메인 페이지로 리다이렉트
	     
	} // kakaoLogin
	
	
	
	
	@RequestMapping(value = "naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public RedirectView login(Model model, HttpSession session) {
		
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        model.addAttribute("url", naverAuthUrl);
        
        RedirectView redirectView = new RedirectView();
		redirectView.setUrl(naverAuthUrl);
		
        return redirectView;
    } // login
	
	
	 
	 @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST }, produces="application/json; charset=UTF-8")
	    public String callback(Member m ,Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse response) throws IOException {
		 	
	        OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);	      
	        apiResult = naverLoginBO.getUserProfile(oauthToken);	        
	        model.addAttribute("result", apiResult);
	       
	        JsonObject jObj = JsonParser.parseString(apiResult).getAsJsonObject();
	        
	           String memId = ((JsonObject)jObj.get("response")).get("id").getAsString();       
	           String nickName = ((JsonObject)jObj.get("response")).get("nickname").getAsString();          
	           String email = ((JsonObject)jObj.get("response")).get("email").getAsString();
	           String phone = ((JsonObject)jObj.get("response")).get("mobile").getAsString();
	           String memName = ((JsonObject)jObj.get("response")).get("name").getAsString();
	    

	            m.setMtId("M");
		        m.setMemId(memId);
		        m.setMemName(memName);
		        m.setNickName(nickName);
		        m.setEmail(email);
		        m.setPhone(phone);
		        m.setMembership("N");
		        m.setMsMonth("N");
		        m.setMsYear("N");
		        
		        Member loginUser = mService.naverLogin(m);
		       System.out.println(m);
	      if(loginUser == null) {	    	 
	    	   	    
	        int result = mService.insertMember(m);
	        
	        if(result > 0) {           
	            session.setAttribute("loginUser", m);         
	            return "redirect:/";
	        } else {	            
	            model.addAttribute("errorMsg", "회원가입 실패");
	            return "common/errorPage"; 
	        }
	        
	      } else {	    	 
	    	  session.setAttribute("loginUser", m);
	    	  return "redirect:/";
	      }
	       
	       
	      
	    } // callback
	 
	 
	 
	@RequestMapping("enrollForm.dv")
	public String deliveryEnrollForm() {
		return "member/deliveryEnrollForm";
	}
	
	// 회원정보 수정
	@RequestMapping("update.me")
	public ModelAndView updateMember(Member m, HttpSession session, ModelAndView mv) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			
			mv.setViewName("member/myPage");
		}else {
			mv.addObject("errorMsg", "회원정보 수정 실패!!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 회원 탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(String memId, String memPwd, HttpSession session, Model model) { 
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
	    
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) { 
			
			int result = mService.deleteMember(memId);
			
			if(result > 0) { 
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.");
				return "redirect:/";
				
			}else { 
				model.addAttribute("errorMsg", "회원 탈퇴 실패!");
				return "common/errorPage";
			}
			
		}else { 
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다. 확인해주세요");
			return "redirect:myPage.me";
		}
		
	}
	
	@RequestMapping("myInfo.me")
	public String myInfo() {
		
		return "redirect:myPage.me";
	}
	
} //Class
