package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getReview(int prodnum);
	public List<ReviewVO> allReview();
	public void insertReview(ReviewVO review);
	public void updateReview(ReviewVO review);
	public void deleteReview(int rnum);
	public ReviewVO getReviewDetail(int rnum);
	public ReviewVO lastReview();
}
