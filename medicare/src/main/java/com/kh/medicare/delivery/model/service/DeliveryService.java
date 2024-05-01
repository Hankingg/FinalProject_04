package com.kh.medicare.delivery.model.service;

import java.util.ArrayList;

import com.kh.medicare.delivery.model.vo.Delivery;
import com.kh.medicare.document.model.vo.Document;

public interface DeliveryService {

	int insertDelivery(Document document, String courier, String billingNo);
	
	ArrayList<Delivery> selectDeliveryList(int memNo);
	
}
