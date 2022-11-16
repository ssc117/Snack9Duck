package com.snack9duck.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.MemberVO;
import com.snack9duck.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Override
	public ArrayList<MemberVO> listAllMember() {
		log.info("Member List All.....");
		return mapper.listAllMember();
	}

	@Override
	public int idCheck(String id) {
		int cnt = mapper.confirmID(id);
		log.info("member confirmID....."+id);
		return cnt;
	}

	@Override
	public void insertMember(MemberVO member) {
		log.info("member insertMember....."+member);
		mapper.insertMember(member);
	}

	@Override
	public MemberVO getMember(String id) {
		log.info("Member getmember.....");
		return mapper.getMember(id);
	}

	@Override
	public MemberVO findId(MemberVO member) {
		log.info("Member findId.....");
		return mapper.findId(member);
		
	}
		

	@Override
	public MemberVO findPwd(MemberVO member) {
		log.info("Member findPwd.....");
	
			return mapper.findPwd(member);
		
	}

	@Override
	public void updateMember(MemberVO member) {
		log.info("Member updateMember.....");
		mapper.updateMember(member);
	}

	@Override
	public void deleteMember(MemberVO member) {
		log.info("Member deleteMember.....");
		mapper.deleteMember(member);
	}

	@Override
	public ArrayList<MemberVO> listMember(String name) {
		log.info("Member listMember.....");
		return mapper.listMember(name);
	}

	@Override
	public int multiDelete(String[] id) {
		int count = 0;
		for (int i = 0; i < id.length; i++) {	
			mapper.multiDelete(id[i]);
			count++;
		}
		return count;
	}

	@Override
	public MemberVO memberLogin(MemberVO member) {
		log.info("Member memberLogin.....");
		return mapper.memberLogin(member);
	}

	@Override
	public MemberVO registerForm(MemberVO member) {
		log.info("Member memberRegister.....");
		return mapper.registerForm(member);
	}
	

}
