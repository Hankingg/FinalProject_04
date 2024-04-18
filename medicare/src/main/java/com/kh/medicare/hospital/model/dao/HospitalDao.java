package com.kh.medicare.hospital.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.hospital.model.vo.Hospital;

@Repository
public class HospitalDao {
	
	public Hospital selectHospitalInfo(SqlSessionTemplate sqlSession, String hpid) {
		return sqlSession.selectOne("hospitalMapper.selectHospitalInfo",hpid);
	}
	
}
