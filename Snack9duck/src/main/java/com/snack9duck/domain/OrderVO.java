package com.snack9duck.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int odseq;
	private int oseq;
	private String id; 
	private Timestamp indate; 
	private String request;
	private String name;
	private String zip_code;
	private String addr1;
	private String addr2;
	private String addr3;
	private String phone1;  
	private String phone2;  
	private String phone3;  
	private int prodnum;
	private String pname;
	private int quantity;
	private int price; 
	private String result;    
	private String image;    
	private String email1;    
	private String email2;
	private int kind;
	@Override
	public String toString() {
		return "OrderVO [odseq=" + odseq + ", oseq=" + oseq + ", id=" + id + ", indate=" + indate + ", request="
				+ request + ", name=" + name + ", zip_code=" + zip_code + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", addr3=" + addr3 + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", prodnum="
				+ prodnum + ", pname=" + pname + ", quantity=" + quantity + ", price=" + price 
				+ ", result=" + result + ", image=" + image + ", email1=" + email1 + ", email2=" + email2 + ", kind="
				+ kind + "]";
	}
	
	
	


}