package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.QnaVO;

public interface QnaService {
	public List<QnaVO> getList();
	public void register(QnaVO qna);
	public QnaVO get(Long qseq);
	public boolean  delete(Long qseq);
	public boolean modify(QnaVO qna);
	public int updateQnaAnswer(QnaVO qna);
	//public List<QnaVO>getQnaList(String id);
	//페이징
	public List<QnaVO> getQnaList(Criteria cri);
	public int getTotalCount(String id);
	public List<QnaVO> getListWithPaging(Criteria cri);
	//회원탈퇴를 위함
	public int qnaDrop(String id);
}
