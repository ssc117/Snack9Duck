package com.snack9duck.service;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.WorkerVO;
import com.snack9duck.mapper.WorkerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WorkerServiceImpl implements WorkerService {

	private WorkerMapper mapper;
	
	@Override
	public WorkerVO adminLogin(WorkerVO worker) {
		log.info("worker adminCheck....." + worker);
		return mapper.adminLogin(worker);
	}

}
