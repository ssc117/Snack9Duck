package com.snack9duck.service;

import java.util.ArrayList;


import com.snack9duck.domain.MemberVO;




public interface MemberService {
	public ArrayList<MemberVO> listAllMember();
	public int idCheck(String id);
	public void insertMember(MemberVO member);
	public MemberVO getMember(String id); 
	public MemberVO findId(MemberVO member);
	public MemberVO findPwd(MemberVO member);
	public void updateMember(MemberVO member);
	public void deleteMember(MemberVO member);
	public ArrayList<MemberVO> listMember(String name);
	public int multiDelete(String[] id);
	public MemberVO memberLogin(MemberVO member);
	//221101 회원가입 후 웰컴 페이지 사용
	public MemberVO registerForm(MemberVO member);
}
