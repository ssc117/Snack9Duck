package com.snack9duck.mapper;

import java.util.List;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.QnaVO;

public interface QnaMapper {
	public List<QnaVO> getList();
	public void insert(QnaVO qna);
	public void insertSelectKey(QnaVO qna);
	public QnaVO read(Long qseq);
	public int delete(Long qseq);
	public int update(QnaVO qna);
	public int updateQnaAnswer(QnaVO qna);
	//public List<QnaVO>getQnaList(String id);
	// 페이징
	public List<QnaVO> getQnaList(Criteria cri);
	public List<QnaVO> getListWithPaging(Criteria cri);
	public int getTotalCount(String id);
	//회원탈퇴를 위함
	public int qnaDrop(String id);
}
