package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.NoticeVO;
import com.snack9duck.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private NoticeMapper mapper;
	
	
	@Override
	public List<NoticeVO> getList() {
		log.info("notice List get.....");
		return mapper.getList();
	}

	@Override
	public void register(NoticeVO notice) {
		log.info("notice register....." + notice);
		mapper.insert(notice);

	}

	@Override
	public NoticeVO get(Long noticeno) {
		log.info("notice get....." + noticeno);
		return mapper.read(noticeno);
	}

	@Override
	public boolean delete(Long noticeno) {
		log.info("notice delete....." + noticeno);
		return mapper.delete(noticeno) == 1;
	}

	@Override
	public boolean modify(NoticeVO notice) {
		log.info("notice modify....." + notice);
		return mapper.update(notice) == 1;
	}

}
