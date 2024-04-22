package com.kh.medicare.document.model.service;

import java.util.ArrayList;

import com.kh.medicare.document.model.vo.Document;

public interface DocumentService {

	ArrayList<Document> selectDocumentList(int memNo);
	
	
	
	
}
