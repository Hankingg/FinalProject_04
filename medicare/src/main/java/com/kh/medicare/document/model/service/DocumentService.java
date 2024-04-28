package com.kh.medicare.document.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.kh.medicare.document.model.vo.Document;

public interface DocumentService {

	ArrayList<Document> selectDocumentList(int memNo);
	
	int insertDocument(Document d);
	
	Document selectDocument(int dcNo);
	
	int deleteDocument(int dcNo); 
}
