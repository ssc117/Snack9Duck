package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class CartVO {

	// Cart
		private int cartnum;
		private String id;
		private int prodnum;
		private int quantity;
		private String result;
		private Timestamp indate;
		
		//멤버 넣으면 mname 삭제
		private String mname;
		// Member
		
		private String pwd;
		
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
		

		//오더에서 필요할 수 있음
		private int price2;

		//product
		
		private String name;
		private String kind;
		private int price;
		private String content;
		private String image;
		private String detail_image;
		private String useyn;
		private Timestamp regdate;
}
