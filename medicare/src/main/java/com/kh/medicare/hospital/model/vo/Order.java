package com.kh.medicare.hospital.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
	private int memNo;
	private int diagnosisType;
	private String addSymtom;
	private String time;
	private String orderDate;
	private String hosCode;
}
