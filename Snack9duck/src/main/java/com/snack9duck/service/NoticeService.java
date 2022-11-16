package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.NoticeVO;

public interface NoticeService {
	//기존 사용
	public List<NoticeVO> getAdminList();
	// 페이징 처리!
	public List<NoticeVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	
	public void register(NoticeVO notice);
	public NoticeVO get(Long noticeno);
	public boolean delete(Long noticeno);
	public boolean modify(NoticeVO notice);
	
	
}
