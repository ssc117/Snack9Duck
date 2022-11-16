package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.snack9duck.domain.MemberVO;
import com.snack9duck.mapper.MemberMapper;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private MemberMapper mapper;

	 @Test
	  public void testAllMember() {
	    mapper.listAllMember().forEach(member -> log.info(member));
	  }
		
	 @Test
	  public void testInsertMember() {
		  MemberVO member = new MemberVO();
		  member.setId("zxcasd");
		  member.setPwd("1234");
		  member.setName("name");
		  member.setEmail1("asd");
		  member.setEmail2("naver.com");
		  member.setZip_code("01030");
		  member.setAddr1("서울 강북구 삼양로 123길 1");
		  member.setAddr2("가나다");
		  member.setAddr3("(수유동)");
		  member.setPhone1("010");
		  member.setPhone2("1234");
		  member.setPhone3("4124");
		  mapper.insertMember(member);;
		  log.info(member);
		  log.info("after insert : " + member.getId());
	  }
	 
	 // ?????
	 @Test 
	  public void testConfirmID() {
		
		 if(mapper.confirmID("asd") == 0) {
			 log.info("----------------------------------");
			 log.info("사용가능한 아이디입니다.");}
		 else {
			 log.info("----------------------------------");
			 log.info("이미 있는 아이디입니다.");}

	 }
	 @Test 
	  public void testGetMember() {
		  MemberVO member = mapper.getMember("id");
		  //사용자가 클릭한 값을 괄호안 (4)에 받아야함
		  log.info(member);
	  }
	 @Test
	  public void testFindId() {
		  MemberVO member = new MemberVO();
		  member.setName("한길동");
		  member.setPhone1("010");
		  member.setPhone2("1241");
		  member.setPhone3("1241");
		  mapper.findId(member);
		  
		  log.info(member);
	  }
	 @Test
	  public void testFindPwd() {
		  MemberVO member = new MemberVO();
		  member.setName("한길동");
		  member.setId("zxc");
		  member.setPhone1("010");
		  member.setPhone2("1241");
		  member.setPhone3("1241");
		  mapper.findPwd(member);
		  
		  log.info(member);
	  }
	 @Test
	  public void testUpdateMember() {
		 MemberVO member = new MemberVO();
		 member.setId("zxcasd");
		  member.setPwd("1234");
		  member.setName("name123123");
		  member.setEmail1("asd");
		  member.setEmail2("naver.com");
		  member.setZip_code("01030");
		  member.setAddr1("서울 강북구 삼양로 123길 1");
		  member.setAddr2("가나다");
		  member.setAddr3("(수유동)");
		  member.setPhone1("010");
		  member.setPhone2("1234");
		  member.setPhone3("4124");
		  mapper.updateMember(member);
		  log.info(member);
	 }
	 
	 @Test
	 public void testDeleteMember() {
		  
		 
	 }
	 
	 @Test
	 public void testMemberList() {
		 mapper.listMember("name");
	 }
	 
	 @Test
	    public void memberLogin() {
		 MemberVO member = new MemberVO();
		 member.setId("asad");
		 member.setPwd("1234");
		 mapper.memberLogin(member);
		 log.info(mapper.memberLogin(member));
	 }	
	 
}
