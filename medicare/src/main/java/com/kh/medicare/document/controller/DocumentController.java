package com.kh.medicare.document.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medicare.document.model.service.DocumentServiceImpl;
import com.kh.medicare.document.model.vo.Document;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentServiceImpl dcService;
	
	
	
	@ResponseBody
	@RequestMapping(value="selectList.dc")
	public String selectDocumentList(int memNo) {
		
		ArrayList<Document> list = dcService.selectDocumentList(memNo);
		
		return new Gson().toJson(list);
	}
	
	
	
	
}
