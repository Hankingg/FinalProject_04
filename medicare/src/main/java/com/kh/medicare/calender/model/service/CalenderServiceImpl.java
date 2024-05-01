package com.kh.medicare.calender.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.calender.model.dao.CalenderDao;
import com.kh.medicare.calender.model.vo.Calender;
import com.kh.medicare.hospital.model.vo.Order;

@Service
public class CalenderServiceImpl implements CalenderService {
	
	@Autowired
	private CalenderDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Calender> calenList() {
		return cDao.calenList(sqlSession);
	}

	

	@Override
	public ArrayList<Calender> myDiagnosisInfo(int memNo) {
		return cDao.myDiagnosisInfo(sqlSession,memNo);
	}

	@Override
	public int deleteOrder(Order order) {
		return cDao.deleteOrder(sqlSession, order);
	}

	@Override
	public int completeOrder(Order order) {
		return cDao.completeOrder(sqlSession, order);
	}

	
}
