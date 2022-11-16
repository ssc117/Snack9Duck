package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getList();
	public void register(NoticeVO notice);
	public NoticeVO get(Long noticeno);
	public boolean delete(Long noticeno);
	public boolean modify(NoticeVO notice);
	
	
}
