package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {
	private long qseq;
	private String type;
	private String subject;
	private String content;
	private String reply;
	private String email;
	private String id;
	private String rep;
	private Timestamp indate;
}
