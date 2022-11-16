package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j //로그 사용-기본적으로 pom.xml에 추가되어있음
public class HotelTests {
	@Setter(onMethod_ = {@Autowired})
	private SampleHotel hotel;

	@Test
	public void testExist() {
		assertNotNull(hotel);

		log.info(hotel);//객체 정보
		log.info("----------------------------------");
		log.info(hotel.getChef());//얻어옴

	}

}
