package com.kh.medicare.document.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class Document {

	private int dcNo;
	private int dcSenderMno;
	private int dcReceiverMno;
	private String dcOriginName;
	private String dcChangeName;
	private String dcFilePath;
	private String dcUploadDate;
	private String dcReadStatus;
	private String dcPaymentStatus;
	private String dcDeliveryStatus;
	private String dcStatus;
	private String memName;
	
}
