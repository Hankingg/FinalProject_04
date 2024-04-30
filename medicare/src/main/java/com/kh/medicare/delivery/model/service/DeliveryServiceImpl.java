package com.kh.medicare.delivery.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.delivery.model.dao.DeliveryDao;
import com.kh.medicare.document.model.vo.Document;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDao dlDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertDelivery(Document document) {

		return dlDao.insertDelivery(sqlSession, document);
	}

}
