package com.kh.medicare.calender.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.calender.model.dao.CalenderDao;
import com.kh.medicare.calender.model.vo.Calender;

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
	public int completeOrder(int memNo) {
		return cDao.completeOrder(sqlSession,memNo);
	}

	@Override
	public int deleteOrder(int memNo) {
		return cDao.deleteOrder(sqlSession,memNo);
	}

}
