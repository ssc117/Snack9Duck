package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.snack9duck.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private MemberService service;
	
	@Test
	public void testAllMember() {
		service.listAllMember().forEach(product -> log.info(product));
	}
	
	//?????????????
	 @Test 
	  public void testConfirmID() {
		 if(service.idCheck("asd") == 0) {
			 log.info("----------------------------------");
			 log.info("사용가능한 아이디입니다.");}
		 else {
			 log.info("----------------------------------");
			 log.info("이미 있는 아이디입니다.");}
	 }
	 
	 @Test
	 public void testInsertMember() {
		 MemberVO member = new MemberVO();
		 member.setId("zxcasd123");
		  member.setPwd("1234");
		  member.setName("namsade");
		  member.setEmail1("asd");
		  member.setEmail2("naver.com");
		  member.setZip_code("01030");
		  member.setAddr1("서울 강북구 삼양로 123길 1");
		  member.setAddr2("가나다");
		  member.setAddr3("(수유동)");
		  member.setPhone1("010");
		  member.setPhone2("1234");
		  member.setPhone3("4124");
		  service.insertMember(member);;
		  log.info(member);
		  log.info("after insert : " + member.getId());
	 }
	 
	 @Test 
	  public void testGetMember() {
		  MemberVO member = service.getMember("asd");
		  log.info(member);
	  }
	 
	 //?????????
	 @Test 
	  public void testFindId() {
		 MemberVO member = new MemberVO();
		  member.setName("한길동");
		  member.setPhone1("010");
		  member.setPhone2("1241");
		  member.setPhone3("1241");
		  //if(service.findId(member)==true) {
			  log.info("생성 가능한 아이디입니다.");
		  //}else {
			  log.info("생성 가능한 아이디입니다.");
		  }
	 //}
	 
	 //???????????
	 @Test 
	  public void testFindPwd() {
		 MemberVO member = new MemberVO();
		  member.setName("한길동");
		  member.setPhone1("010");
		  member.setPhone2("1241");
		  member.setPhone3("1241");
		  member.setId("asd");
//		  if(service.findId(member)==true) {
//			  log.info("생성 가능한 아이디입니다.");
//		  }else {
//			  log.info("생성 가능한 아이디입니다.");
//		  }
	 }
	 
	 @Test
	  public void testUpdateMember() {
		 MemberVO member = new MemberVO();
		 member.setId("asd");
		  member.setPwd("1234");
		  member.setName("name123123");
		  member.setEmail1("asd");
		  member.setEmail2("nav123er.com");
		  member.setZip_code("01030");
		  member.setAddr1("서울 강북구 삼양로 123길 1");
		  member.setAddr2("가나124다");
		  member.setAddr3("(수유동)");
		  member.setPhone1("010");
		  member.setPhone2("1234");
		  member.setPhone3("4124");
		  service.updateMember(member);
		  log.info(member);
	 }
	 
	 @Test
	 public void testDeleteMember() {
		 //service.deleteMember("zxcasd123");
		 
	 }
	 
	 @Test
	 public void testMemberList() {
		 service.listMember("김");
	 }
	 
	 @Test
	 public void testMultiDelete() {
		 String[] id = {"zxcasd123", "id"};
		 service.multiDelete(id);
	 }
}
	