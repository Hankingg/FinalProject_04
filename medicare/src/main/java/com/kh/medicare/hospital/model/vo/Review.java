package com.kh.medicare.hospital.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Review {
	private int revNo;
	private String memNo;
	private String revContent;
	private Date revDate;
	private double rate;
	private String rvStatus;
	private String hosCode;
	private String imgFileNo;
	private String hosName;
	private int reviewCount;
	private String nickName;
}
