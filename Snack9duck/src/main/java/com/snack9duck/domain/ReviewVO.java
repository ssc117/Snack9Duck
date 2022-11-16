package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	private int rnum;
	
	private String id;
	private int prodnum;

	private String content;
	private Timestamp indate;
}
