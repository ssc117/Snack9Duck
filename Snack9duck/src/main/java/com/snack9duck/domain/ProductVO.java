package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Setter;

@Data
public class ProductVO {
	private long prodnum; // 상품번호
	private String name; // 상품 이름
	private int kind; // 상품 종류 1 2 3 4
	private int price; // 가격
	private String content; // 상품 설명
	private String image; // 썸네일 이미지
	private String detail_image; //상품 상세 이미지
	private String useyn; // 사용 1 사용안함0
	private Timestamp regdate; // 상품 등록일
	
}
