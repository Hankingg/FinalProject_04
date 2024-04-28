package com.kh.medicare.calender.model.vo;

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
public class Calender {
	private String textColor; // memNo 대신
	private String id;
	private String title;
	private String start;
	private String borderColor;
	private String end;
	private String orderDate;
	private String orderToday;
	private String groupId; // orderStatus 대신
	private String backgroundColor;
}
