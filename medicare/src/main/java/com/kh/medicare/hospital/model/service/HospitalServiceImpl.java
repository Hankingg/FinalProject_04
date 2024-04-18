package com.kh.medicare.hospital.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medicare.hospital.model.dao.HospitalDao;
import com.kh.medicare.hospital.model.vo.Hospital;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private HospitalDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Hospital selectHospitalInfo(String hpid) {
		return hDao.selectHospitalInfo(sqlSession,hpid);
	}
	
}
