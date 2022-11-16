package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private long noticeno;
	private String writer;
	private String title;
	private String content;
	private Timestamp indate;
}
