package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.snack9duck.domain.ProductVO;
import com.snack9duck.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList() {
		log.info("product List get.....");
		return mapper.getList();
	}

	@Override
	public void register(ProductVO product) {
		log.info("product register....." + product);
		//mapper.insertSelectKey(product);
		mapper.insert(product);

	}

	@Override
	public ProductVO get(Long prodnum) {
		log.info("product get....." + prodnum);
		return mapper.read(prodnum);
	}

	@Override
	public boolean delete(Long prodnum) {
		log.info("product delete....." + prodnum);
		return mapper.delete(prodnum) == 1;
	}

	@Override
	public boolean modify(ProductVO product) {
		log.info("product modify....." + product );
		return mapper.update(product) == 1;
	}
	
	public List<ProductVO> listKindProduct(String kind) {
		log.info("listKindProduct get....."+ kind);
		return mapper.listKindProduct(kind);
	}

	@Override
	public List<ProductVO> getAllList() {
		log.info("admin getAllList.....");
		return mapper.getAllList();
	}

}
