package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.ProductVO;

public interface ProductMapper {
	//public List<ProductVO> getList();
	public List<ProductVO> getList();
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long prodnum);
	public int delete(Long prodnum);
	public int update(ProductVO product);
	public List<ProductVO> listKindProduct(String kind);
	//관리자용 상품 전체 정보 가져오기
	public List<ProductVO> getAllList();
	
	
}
