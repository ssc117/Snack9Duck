package com.snack9duck.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class EventVO {
	
	private long eventno;
    private String subject;
    private String img;
    private String mainimg;
    private String content;
    private String upload;
    private Date indate; 
}
