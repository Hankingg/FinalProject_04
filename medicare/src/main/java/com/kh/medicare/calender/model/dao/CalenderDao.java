package com.kh.medicare.calender.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.medicare.calender.model.vo.Calender;


@Repository
public class CalenderDao {
	public ArrayList<Calender> calenList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("hospitalMapper.calenList");
	}
	
	public int completeOrder(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.update("hospitalMapper.completeOrder", memNo);
	}
	
	public int deleteOrder(SqlSessionTemplate sqlSession,int memNo) {
		return sqlSession.update("hospitalMapper.deleteOrder", memNo);
	}
	
	public ArrayList<Calender> myDiagnosisInfo(SqlSessionTemplate sqlSession, int memNo ){
		return (ArrayList)sqlSession.selectList("hospitalMapper.myDiagnosisInfo", memNo);
	}
}
