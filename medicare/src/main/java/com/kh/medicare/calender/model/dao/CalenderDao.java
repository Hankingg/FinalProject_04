package com.kh.medicare.calender.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.calender.model.vo.Calender;
import com.kh.medicare.hospital.model.vo.Order;


@Repository
public class CalenderDao {
	public ArrayList<Calender> calenList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("hospitalMapper.calenList");
	}
	
	public int completeOrder(SqlSessionTemplate sqlSession,Order order) {
		return sqlSession.update("hospitalMapper.completeOrder", order);
	}
	
	public int deleteOrder(SqlSessionTemplate sqlSession,Order order) {
		return sqlSession.update("hospitalMapper.deleteOrder", order);
	}
	
	public ArrayList<Calender> myDiagnosisInfo(SqlSessionTemplate sqlSession, int memNo ){
		return (ArrayList)sqlSession.selectList("hospitalMapper.myDiagnosisInfo", memNo);
	}

}
