package com.kh.medicare.api.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor// 기본생성자
@AllArgsConstructor// 전체 매개변수생성자
@Setter // setter 메소드
@Getter // getter 메소드
@ToString
public class Api {
	private String q0; // 병원 주소 (시도)
	private String q1; // 병원 주소 (시군구)
	private String qZ; // 병원 종류 (b:병원, c:의원)
	private String qd; // 진료 코드 (D001~D029)
	private int qt;	//  월~일요일(1~7), 공휴일(8)
	private String qn; // 기관명
	private String ord; // 순서
}
