package com.kh.medicare.delivery.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.document.model.vo.Document;

@Repository
public class DeliveryDao {

	public int insertDelivery(SqlSessionTemplate sqlSession, Document document) {
		
		return sqlSession.insert("deliveryMapper.insertDelivery", document);
	}
	
	
	
	
}
