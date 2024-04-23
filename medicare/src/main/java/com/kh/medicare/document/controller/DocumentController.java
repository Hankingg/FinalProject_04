package com.kh.medicare.document.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.medicare.document.model.service.DocumentServiceImpl;
import com.kh.medicare.document.model.vo.Document;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentServiceImpl dcService;
	
	
	
	@ResponseBody
	@RequestMapping(value="selectList.dc", produces= "application/json; charset=UTF-8")
	public String selectDocumentList(int memNo) {
		
		ArrayList<Document> list = dcService.selectDocumentList(memNo);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("insertDocument.dc")
	public String insertDocument(Document d ,MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(d);
		System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			d.setDcOriginName(upfile.getOriginalFilename());
			d.setDcChangeName("resources/uploadFiles/" + changeName);
		}
		System.out.println("여긴오냐");
		int result = dcService.insertDocument(d);
		
		if(result > 0) { // 성공 => 게시글 리스트 페이지 (list.bo url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글 등록되었습니다.");
			return "redirect:/";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		// "20240405030705" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20240403030905"
		int ranNum = (int)(Math.random() * 90000 + 10000); // 23152 (5자리 랜덤값)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		
		return changeName;
	}
	

}
