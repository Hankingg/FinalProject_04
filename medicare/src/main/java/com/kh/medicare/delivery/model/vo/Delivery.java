package com.kh.medicare.delivery.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
public class Delivery {

	private int dNo;
	private int dSenderMno;
	private int dReceiverMno;
	private String billingNo;
	private String courier;
	private String memName;
	
}
