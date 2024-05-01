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
import java.time.LocalDate;
import java.util.ArrayList;
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
import com.kh.medicare.common.model.vo.PageInfo;
import com.kh.medicare.common.template.Pagination;
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
			return "member/login";		
		} else { 
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
		 
	} // insertMember
	
	@RequestMapping("moveChangePwd.me")
	public String moveChangePwd() {
		
		return "member/changePwd";
	}
	
	 @RequestMapping("changePwd.me")
	    public ModelAndView changePwd(Member m, ModelAndView mv, HttpSession session) {
	    	
	    	String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());

			m.setMemPwd(encPwd);
			
			int result = mService.changePwd(m); 
	    	
	    	if(result > 0) {						
				session.setAttribute("alertMsg", "비밀번호 수정 완료!");			
				mv.setViewName("member/login");
			
	    	}else {
				mv.addObject("errorMsg", "회원정보 수정 실패!!");
				mv.setViewName("common/errorPage");
			}
	    	
	    	return mv;
	    
	    } // changePwd
	
	
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
	
	@RequestMapping("moveAdminMemberCheck.me")
	public ModelAndView adminCheckPwd(@RequestParam(value="cpage", defaultValue="1") int currentPage, Member m, HttpSession session, ModelAndView mv) {
		
		Member selectMember = mService.loginMember(m);
		
		int listCount = mService.selectListCount();		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<Member> adminSelectMem = mService.adminSelectMem(pi);
		
		
		if(selectMember != null && bcryptPasswordEncoder.matches(m.getMemPwd(), selectMember.getMemPwd())) {
			mv.addObject("adminSelectMem", adminSelectMem);
			mv.addObject("pi", pi); 
			mv.setViewName("member/adminSelectMember");				
		} else {		
			session.setAttribute("alertMsg", "관리자 인증에 실패 하였습니다. 비밀번호를 확인 해주세요.");
			mv.setViewName("redirect:/myPage.me");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("adminCheckPwd.me")
	public ModelAndView adminMember(@RequestParam(value="cpage", defaultValue="1") int currentPage, Member m, HttpSession session, ModelAndView mv) {
		
		int listCount = mService.selectListCount();		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<Member> adminSelectMem = mService.adminSelectMem(pi);		
					 
			mv.addObject("adminSelectMem", adminSelectMem);
			mv.addObject("pi", pi); 		
			mv.setViewName("member/adminSelectMember");	
			
			return mv;
	} // adminMember
	
	@RequestMapping("adminRestore.me")
	public ModelAndView adminRestore(@RequestParam(value="cpage", defaultValue="1") int currentPage, Member m, HttpSession session, ModelAndView mv) {
		
		int listCount = mService.selectListCount();		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<Member> adminRestoreMem = mService.adminRestoreMem(pi);		
					 
			mv.addObject("adminSelectMem", adminRestoreMem);
			mv.addObject("pi", pi); 		
			mv.setViewName("member/adminRestoreMember");	
			
			return mv;
	} // adminMember
	
	@RequestMapping("adminDeleteMember.me")
	public ModelAndView adminDeleteMember(@RequestParam("deleteMember") int[] members,HttpSession session, ModelAndView mv) {
		
		int result = mService.adminDeleteMember(members);
		
		if(result > 0) {
			mv.addObject("alertMsg", "회원 삭제 성공");				
			mv.setViewName("redirect:/adminCheckPwd.me");			
		} else {
			mv.addObject("errorMsg", "관리자 인증실패");
			mv.setViewName("common/errorPage");	
		}
		
		return mv;
		
	} // adminDeleteMember
	
	@RequestMapping("restoreMember.me")
	public ModelAndView adminRestoreMember(@RequestParam("restoreMember") int[] members,HttpSession session, ModelAndView mv) {
		
		int result = mService.adminRestoreMember(members);
		
		if(result > 0) {
			mv.addObject("alertMsg", "회원 복구 성공");				
			mv.setViewName("redirect:/adminCheckPwd.me");			
		} else {
			mv.addObject("errorMsg", "회원 복구 실패");
			mv.setViewName("common/errorPage");	
		}
		
		return mv;
		
	} // adminDeleteMember
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";	
		
	} //  logoutMember
	
	@RequestMapping("kakaoLogin.me")
	public void kakaoLogin(Member m, HttpSession session, Model model, HttpServletResponse response) throws IOException {
    	
		m.setEnrollType("K");
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
	        LocalDate now = LocalDate.now();
	       
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
		        m.setEnrollType("N");
		        
		        
		        Member loginUser = mService.naverLogin(m);
		        System.out.println("결제 회원정보 테스트 : " + loginUser);
	      if(loginUser == null) {	    	 
	    	   	    
	        int result = mService.insertMember(m);
	        
	        if(result > 0) {           
	            session.setAttribute("loginUser", loginUser);         
	            return "redirect:/";
	        } else {	            
	            model.addAttribute("errorMsg", "회원가입 실패");
	            return "common/errorPage"; 
	        }
	        
	      } else {	    	 
	    	  session.setAttribute("loginUser", loginUser);
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
	
	
	@RequestMapping("moveChatList.ch")
	public String chatList(HttpSession session) {
		
		return "chat/chooseInfoChat";	
		
	} //  logoutMember
	
	
    @RequestMapping("chatForm.ch")
    public ModelAndView chatForm(Member memId, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, ModelAndView mv) {
           
        
        Member loginUser = mService.loginMember(memId);		
        
        System.out.println("채팅테스트1 : " + loginUser);
        
        
        session.setAttribute("loginUser", loginUser);
               
        mv.setViewName("member/chattingTest");
        
        return mv;
    }
    
    
    @ResponseBody
    @RequestMapping("select.memId")
    public Member selectMemId(Member m,Model model) {
    	System.out.println("Member:"+m);
    	Member loginUser = mService.loginMember(m);
    	System.out.println(loginUser);
    	model.addAttribute("m",loginUser);
    	
    	return loginUser;
    }
    
	
    @RequestMapping("hInfoChat.ch")
    public ModelAndView hInfoChat(Member memId, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, ModelAndView mv) {
           
        
        Member loginUser = mService.loginMember(memId);		
        
        System.out.println("채팅테스트2 : " + loginUser);
        
        
        session.setAttribute("loginUser", loginUser);
        
        
        mv.setViewName("member/hInfoChat");
        
        return mv;
    }
    
    @RequestMapping("khInfoChat.ch")
    public ModelAndView khInfoChat(Member memId, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, ModelAndView mv) {
           
        
        Member loginUser = mService.loginMember(memId);		
        
        System.out.println("채팅테스트3 : " + loginUser);
        
        
        session.setAttribute("loginUser", loginUser);
        
        
        mv.setViewName("member/khInfoChat");
        
        return mv;
    }
    
    @RequestMapping("cInfoChat.ch")
    public ModelAndView cInfoChat(Member memId, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, ModelAndView mv) {
           
        
        Member loginUser = mService.loginMember(memId);		
        
        System.out.println("채팅테스트4 : " + loginUser);
        
        
        session.setAttribute("loginUser", loginUser);
        
        
        mv.setViewName("member/cInfoChat");
        
        return mv;
    }
    
    
    
} //Class
