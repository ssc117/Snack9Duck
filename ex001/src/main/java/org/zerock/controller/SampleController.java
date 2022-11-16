package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")//sample이하의 모든 요청은 samplecontroller에서 처리 됨
@Log4j
public class SampleController {
	
	//p.135~
//	  @InitBinder
//	  public void initBinder(WebDataBinder binder) {//String을 Date 타입으로
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//	  }

	//p.129~
	//method를 배열로 2개 줌 - get/post방식 모두 처리 ok
	@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
	  public void basicGet() {
	    log.info("basic get...................");
	  }

	  @RequestMapping("")
	  public void basic() {
		  log.info("basic .............");
	  }
	  
	  @GetMapping("/basicOnlyGet")//requestMapping의 축약형 - get방식
	  public void basicGet2() {
		  log.info("basicOnlyGet...................");
		  // return설정 X => 요청명(basicOnlyGet).jsp로 전달
	  }
	  
	  @GetMapping("/ex01")
	  public String ex01(SampleDTO dto) { //객체를 받아서 전달
		  log.info(""+dto);
		  return "ex01";
		  //http://localhost:8090/sample/ex01?name=AAA&age=25로 요청
		  //결과 : SampleDTO(name=AAA, age=25)
	  }
	  
	  @GetMapping("/ex02")
	  public String ex02(@RequestParam("name") String name,
			  @RequestParam("age") int age) { 
		  //요청해서 전달 받은 값을 name,age에 담음
		  //파라미터의 타입 지정 가능
		  //사용된 변수의 이름과 전달되는 파라미터의 이름이 다른 경우에 유용 
		  //ex) ?name1=aaa로 값을 받고 name으로 전달하고자 할 때
		  log.info("name : "+name);
		  log.info("age : "+age);
		  return "ex02";
		  //http://localhost:8090/sample/ex02?name=AAA&age=25로 요청
		  //결과 : name : AAA / age : 25
	  }
	  
	  @GetMapping("/ex02List")
	  //String을 담는 ArrayList에 ids의 배열 값을 담음
	  public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		  log.info("ids : "+ids);
		  return "ex02List";
		  //요청 : http://localhost:8090/sample/ex02List?ids=1111&ids=2222&ids=3333
		  //결과 : ids : [1111, 2222, 3333]
	  }
	  
	  @GetMapping("/ex02Bean") //SampleDTO객체의 배열을 담고있는 list
	  public String ex02Bean(SampleDTOList list) {//SampleDTO를 담는 List를 받음
		  log.info("list dtos : "+list);
		  return "sample/ex02Bean"; // 객체로 받고 싶으면 > ${sampleDTOList}
		  //요청 : ../sample/ex02Bean?list%5B0%5D.name=aaa&list%5B2%5D.name=bbb
		  //list[0].name => list%5B0%5D.name 
		  // [ = %5B / ] = %5D
		  //결과 : list dtos : SampleDTOList(list=[SampleDTO(name=aaa, age=0), SampleDTO(name=null, age=0), SampleDTO(name=bbb, age=0)])
	  }
	  
	  //p.135~
	  @GetMapping("/ex03")
	  public String ex03(TodoDTO todo) {
	    log.info("todo: " + todo);
	    return "ex03";
	    //initbinder 어노테이션 사용
	    //요청 : ../sample/ex03?title=test&dueDate=2022-01-02
	    //결과 : - todo: TodoDTO(title=test, dueDate=Sun Jan 02 00:00:00 KST 2022)
	    
	    //DateTimeFormat 어노테이션 사용 - TodoDTO.java
		//요청 : ../sample/ex03?title=test&dueDate=2022/01/02
		//결과 : - todo: TodoDTO(title=test, dueDate=Sun Jan 02 00:00:00 KST 2022)
	  }
	  
	  //타입에 관계없이 무조건 model에 담아서 전달 >파라미터로 전달 된 데이터를 화면에서 사용해야 할 경우
	  @GetMapping("/ex04")
	  public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {

	    log.info("dto: " + dto);
	    log.info("page: " + page);

	    return "/sample/ex04";
	    //요청 : ../sample/ex04?name=hong&age=20&page=9
	    //에러 : http://localhost:8090//sample/ex04?name=홍길동&age=a
	    //결과 : -dto: SampleDTO(name=hong, age=20)/ - page: 9
	    //값을 페이지(화면)에 전달하기 위해 @ModelAttribute("page")사용
	  }
	  
	  @GetMapping("/ex06")
	  public @ResponseBody SampleDTO ex06() {
	    log.info("/ex06..........");

	    SampleDTO dto = new SampleDTO();
	    dto.setAge(10);
	    dto.setName("홍길동");

	    return dto; //json 형식으로 객체타입 반환 @ResponseBody필수!
	    //요청 : http://localhost:8090/sample/ex06
	    //결과 : {"name":"홍길동","age":10} 
	  }
	  
	  @GetMapping("/ex07")
	  public ResponseEntity<String> ex07() {
	    log.info("/ex07..........");
	    
	    //{"name": "홍길동"}
	    String msg = "{\"name\": \"홍길동\"}";
	    
	    HttpHeaders header = new HttpHeaders();
	    header.add("Content-Type", "application/json;charset=UTF-8");
	    return new ResponseEntity<>(msg,header,HttpStatus.OK);
	  
	    //요청 : http://localhost:8090/sample/ex07
	    //결과 : {"name":"홍길동","age":10} 
	  }
	  @GetMapping("/re1")
	  public String re1() {
		  log.info("rel.....................");
		  return "redirect:/sample/re2";
	  }
	  @GetMapping("/re2")
	  public void re2() {
		  log.info("re2.....................");
	  }
	  @GetMapping("/exUpload")
	  public void uxUpload() {
		  log.info("/exUpload");
	  }
	  @PostMapping("/exUploadPost")
	  public void exUploadPost(ArrayList<MultipartFile> files) {
		  files.forEach(file ->{
			  log.info("--------------------------------");
			  log.info("name:" + file.getOriginalFilename());
			  log.info("size:" + file.getSize());
			  log.info("type:" + file.getContentType());
			  });
	  }
}
