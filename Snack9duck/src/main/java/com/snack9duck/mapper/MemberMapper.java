package com.snack9duck.mapper;

import java.util.ArrayList;

import com.snack9duck.domain.MemberVO;




public interface MemberMapper {
	public ArrayList<MemberVO> listAllMember();
	public int confirmID(String id);
	public int insertMember(MemberVO member);
	public MemberVO getMember(String id); 
	public MemberVO findId(MemberVO member);
	public MemberVO findPwd(MemberVO member);
	public void updateMember(MemberVO member); // 몇개 업데이트 했는지 return 받음
	public void deleteMember(MemberVO member); // 몇개 삭제했는지 return 받음
	public ArrayList<MemberVO> listMember(String name);
	public int multiDelete(String[] id);
	public void multiDelete(String string);
	public MemberVO memberLogin(MemberVO member);
	//221101 회원가입 후 웰컴 페이지 사용
	public MemberVO registerForm(MemberVO member);
}
