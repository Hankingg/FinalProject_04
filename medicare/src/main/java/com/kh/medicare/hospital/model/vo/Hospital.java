package com.kh.medicare.hospital.model.vo;

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
public class Hospital {
	private String hosCode;
	private String hosAddress;
	private String hosCtg;
	private int emgYn;
	private String hosName;
	private String hosTel;
	private String hosCtMon;
	private String hosCtTue;
	private String hosCtWen;
	private String hosCtThu;
	private String hosCtFri;
	private String hosCtSat;
	private String hosCtSun;
	private String hosCtHol;
	private String hosStMon;
	private String hosStTue;
	private String hosStWen;
	private String hosStThu;
	private String hosStFri;
	private String hosStSat;
	private String hosStSun;
	private String hosStHol;
	private double hosLongitude;
	private double hosLatitude;
	private int distance;
	private double reviewAvg;
}
