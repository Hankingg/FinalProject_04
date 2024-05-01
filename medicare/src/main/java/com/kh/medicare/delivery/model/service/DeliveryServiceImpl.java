package com.kh.medicare.delivery.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.delivery.model.dao.DeliveryDao;
import com.kh.medicare.delivery.model.vo.Delivery;
import com.kh.medicare.document.model.vo.Document;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDao dlDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertDelivery(Document document, String courier, String billingNo) {

		return dlDao.insertDelivery(sqlSession, document, courier, billingNo);
	}


	@Override
	public ArrayList<Delivery> selectDeliveryList(int memNo) {
		
		return dlDao.selectDeliveryList(sqlSession, memNo);
	}

}
