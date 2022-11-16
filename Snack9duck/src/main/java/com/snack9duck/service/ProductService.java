package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.ProductVO;

public interface ProductService {
	
	public List<ProductVO> getList();
	
	//public void insert(ProductVO product);
	public void register(ProductVO product);
	
	// public void insertSelectKey(ProductVO product);
	
	//public ProductVO read(Long prodnum);
	public ProductVO get(Long prodnum);
	
	//public int delete(Long prodnum);
	public boolean  delete(Long prodnum);

	//public int update(ProductVO product);
	public boolean modify(ProductVO product);
	
	//카테고리 별 상품 리스트
	public List<ProductVO> listKindProduct(String kind);
	
	//관리자용 상품 전체 정보 가져오기
	public List<ProductVO> getAllList();
}
