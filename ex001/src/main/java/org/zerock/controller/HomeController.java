package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/* web.xml - url-pattern이 /인 곳으로 이동
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
	*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	//http://localhost:8090/
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale); //Welcome home! The client locale is ko_KR.
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		//date를 받아와서 dateFormat형식으로 바꿔 String타입으로 저장
		
		//전달 - request.setAttribute와 같은 역할
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
		//이동할 jsp파일의 이름을 들고 servlet-context.xml로 이동 > 접두/접미 붙여서 ../home.jsp로 이동
	}
	
}
