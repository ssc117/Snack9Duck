package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.snack9duck.domain.WorkerVO;
import com.snack9duck.mapper.WorkerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WorkerMapperTest {
	@Setter(onMethod = @__({ @Autowired }))
	private WorkerMapper mapper;
	
	@Test
	public void testAdminCheck(){
		WorkerVO worker = new WorkerVO();
		worker.setWorkerid("admin");
		worker.setWorkerpwd("1234");
		mapper.adminLogin(worker);
		log.info(mapper.adminLogin(worker));
	}

}
