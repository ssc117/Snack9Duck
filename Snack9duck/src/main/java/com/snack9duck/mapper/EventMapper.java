package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.EventVO;

public interface EventMapper {
	public List<EventVO> getList();
	public void insert(EventVO event);
	public void insertSelectKey(EventVO event);
	public EventVO read(Long eventno);
	public int delete(Long eventno);
	public int update(EventVO event);
	public List<EventVO> endEventList();
	public List<EventVO> getAllList();
}
