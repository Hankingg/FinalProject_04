package com.kh.medicare.membership.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Membership {
	private int memNo;
	private String price;
	private Date msMonth;
	private Date msYear;
	private Date expirationDate;
	Date buyDate;
	Date endDate;
} // Class
