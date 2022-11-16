package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.ReviewVO;

import com.snack9duck.mapper.ReviewMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getReview(int prodnum) {
		return mapper.getReview(prodnum);
	}

	@Override
	public List<ReviewVO> allReview() {
		return mapper.allReview();
	}

	@Override
	public void insertReview(ReviewVO review) {
		mapper.insertReview(review);
		
	}

	@Override
	public void updateReview(ReviewVO review) {
		mapper.updateReview(review);
		
	}

	@Override
	public void deleteReview(int rnum) {
		mapper.deleteReview(rnum);
		
	}

	@Override
	public ReviewVO getReviewDetail(int rnum) {
		
		return mapper.getReviewDetail(rnum);
	}

	@Override
	public ReviewVO lastReview() {
		
		return mapper.lastReview();
	}

}
