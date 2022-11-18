package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getAdminList();
	public void insert(NoticeVO notice);
	public void insertSelectKey(NoticeVO notice);
	public NoticeVO read(Long noticeno);
	public int delete(Long noticeno);
	public int update(NoticeVO notice);
	//페이징 처리!
	public List<NoticeVO>getList(Criteria cri);
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
}
