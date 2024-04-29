package com.kh.medicare.kHospital.model.service;

import javax.websocket.server.ServerEndpoint;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.hospital.model.vo.Review;
import com.kh.medicare.kHospital.model.dao.KhospitalDao;

@Service
public class KhospitalServiceImpl implements KhospitalService{
	
	@Autowired
	private KhospitalDao kDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
