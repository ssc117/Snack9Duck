package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getList();
	public void insert(NoticeVO notice);
	public void insertSelectKey(NoticeVO notice);
	public NoticeVO read(Long noticeno);
	public int delete(Long noticeno);
	public int update(NoticeVO notice);
	
}
