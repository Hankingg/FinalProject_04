package com.kh.medicare.calender.model.service;

import java.util.ArrayList;

import com.kh.medicare.calender.model.vo.Calender;
import com.kh.medicare.hospital.model.vo.Order;

public interface CalenderService {
	ArrayList<Calender> calenList();
	
	int completeOrder(Order order);
	
	int deleteOrder(Order order);
	
	ArrayList<Calender> myDiagnosisInfo(int memNo);
	
}
