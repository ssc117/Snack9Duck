package com.snack9duck.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	private String id;

	public Criteria() {
		this(1, 5);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public Criteria(int pageNum, int amount, String id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.id = id;
	}
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
