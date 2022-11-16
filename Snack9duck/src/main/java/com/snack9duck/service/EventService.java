package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.EventVO;

public interface EventService {
	public List<EventVO> getList();
	public void register(EventVO event);
	public EventVO get(Long eventno);
	public boolean delete(Long eventno);
	public boolean modify(EventVO event);
	public List<EventVO> endEventList();
	public List<EventVO> getAllList();
}
