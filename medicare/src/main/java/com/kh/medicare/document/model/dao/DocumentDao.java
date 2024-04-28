package com.kh.medicare.document.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.medicare.document.model.vo.Document;

@Repository
public class DocumentDao {

	
	
	public ArrayList<Document> selectDocumentList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocumentList", memNo);
	}
	
	public int insertDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDocument", d);
	}
	
	public Document selectDocument(SqlSessionTemplate sqlSession, int dcNo) {
		return sqlSession.selectOne("documentMapper.selectDocument", dcNo);
	}
	
	public int deleteDocument(SqlSessionTemplate sqlSession, int dcNo) {
		return sqlSession.update("documentMapper.deleteDocument", dcNo);
	}
	
	
}
