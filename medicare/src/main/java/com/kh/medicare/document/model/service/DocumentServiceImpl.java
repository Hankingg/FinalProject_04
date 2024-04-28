package com.kh.medicare.document.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.medicare.document.model.dao.DocumentDao;
import com.kh.medicare.document.model.vo.Document;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentDao dcDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Document> selectDocumentList(int memNo) {
		
		return dcDao.selectDocumentList(sqlSession, memNo);
	}


	@Override
	public int insertDocument(Document d) {
		return dcDao.insertDocument(sqlSession,d);
	}


	@Override
	public Document selectDocument(int dcNo) {
		
		return dcDao.selectDocument(sqlSession, dcNo);
	}


	@Override
	public int deleteDocument(int dcNo) {
		
		return dcDao.deleteDocument(sqlSession, dcNo);
	}

	
	
	
	
	
}
