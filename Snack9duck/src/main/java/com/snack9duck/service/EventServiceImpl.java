package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.EventVO;
import com.snack9duck.mapper.EventMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService {
	
	private EventMapper mapper;
	
	@Override
	public List<EventVO> getList() {
		log.info("event List get.....");
		return mapper.getList();
	}

	@Override
	public void register(EventVO event) {
		log.info("event register....." + event);
		mapper.insert(event);

	}

	@Override
	public EventVO get(Long eventno) {
		log.info("event get....." + eventno);
		return mapper.read(eventno);
	}

	@Override
	public boolean delete(Long eventno) {
		log.info("event delete....." + eventno);
		return mapper.delete(eventno) == 1;
	}

	@Override
	public boolean modify(EventVO event) {
		log.info("event modify....." + event);
		return mapper.update(event) == 1;
	}
	@Override
	public List<EventVO> endEventList(){
		log.info("end event List get.....");
		return mapper.endEventList();
	}

	@Override
	public List<EventVO> getAllList() {
		log.info("all event list get......");
		return mapper.getAllList();
	}

}
