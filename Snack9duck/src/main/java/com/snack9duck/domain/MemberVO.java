package com.snack9duck.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	
	private String id;
	
	private String pwd;
	private String name;
	private String email1;
	private String email2;
	private String zip_code;
	private String addr1; //기본주소
	private String addr2; //상세주소
	private String addr3; //참고사항
	private String phone1;
	private String phone2;
	private String phone3;
	private String request;
	private String useyn;
	private Date regdate;
	
	
}
