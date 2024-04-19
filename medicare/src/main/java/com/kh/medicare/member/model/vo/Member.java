package com.kh.medicare.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {

	private int memNo;
	private String mtId;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickName;
	private String email;
	private String address;
	private String phone;
	private String membership;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
	private String msMonth;
	private String msYear;
	private Date buyDate;
	private Date endDate;
	
	
}
