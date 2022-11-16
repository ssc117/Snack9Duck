package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.QnaVO;

public interface QnaService {
	public List<QnaVO> getList();
	public void register(QnaVO qna);
	public QnaVO get(Long qseq);
	public boolean  delete(Long qseq);
	public boolean modify(QnaVO qna);
	public int updateQnaAnswer(QnaVO qna);
	public List<QnaVO>getQnaList(String id);
	
}
