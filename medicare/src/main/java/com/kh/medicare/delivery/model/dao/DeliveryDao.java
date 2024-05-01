package com.kh.medicare.delivery.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.delivery.model.vo.Delivery;
import com.kh.medicare.document.model.vo.Document;

@Repository
public class DeliveryDao {

	public int insertDelivery(SqlSessionTemplate sqlSession, Document document, String courier, String billingNo) {
		HashMap<String, Object> params = new HashMap<>();
	    params.put("document", document);
	    params.put("courier", courier);
	    params.put("billingNo", billingNo);
		
		return sqlSession.insert("deliveryMapper.insertDelivery", params);
	}
	
	public ArrayList<Delivery> selectDeliveryList(SqlSessionTemplate sqlSession, int memNo){
		
		return (ArrayList)sqlSession.selectList("deliveryMapper.selectDeliveryList", memNo);
	}
	
	
	
}
