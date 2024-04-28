package com.kh.medicare.calender.model.service;

import java.util.ArrayList;

import com.kh.medicare.calender.model.vo.Calender;

public interface CalenderService {
	ArrayList<Calender> calenList();
	
	int completeOrder(int memNo);
	
	int deleteOrder(int memNo);
}
