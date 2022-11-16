package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.QnaVO;

public interface QnaMapper {
	public List<QnaVO> getList();
	public void insert(QnaVO qna);
	public void insertSelectKey(QnaVO qna);
	public QnaVO read(Long qseq);
	public int delete(Long qseq);
	public int update(QnaVO qna);
	public int updateQnaAnswer(QnaVO qna);
	public List<QnaVO>getQnaList(String id);
}
