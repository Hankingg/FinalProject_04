package com.kh.medicare.document.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.document.model.vo.Document;

@Repository
public class DocumentDao {

	
	
	public ArrayList<Document> selectDocumentList(SqlSessionTemplate sqlSession, int memNo){
		
		
		return (ArrayList)sqlSession.selectList("DocumentMapper.selectDocumentList", memNo);
	}
	
	
	
	
}
