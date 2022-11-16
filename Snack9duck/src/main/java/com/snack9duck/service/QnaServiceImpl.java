package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.QnaVO;
import com.snack9duck.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	private QnaMapper mapper;	
	
	@Override
	public List<QnaVO> getList() {
		log.info("qna List Get.....");
		return mapper.getList();
	}

	@Override
	public void register(QnaVO qna) {
		log.info("qna register....." + qna);
		mapper.insert(qna);

	}

	@Override
	public QnaVO get(Long qseq) {
		log.info("qna get....." + qseq);
		return mapper.read(qseq);
	}

	@Override
	public boolean delete(Long qseq) {
		log.info("qna delete"+ qseq);
		return mapper.delete(qseq) == 1;
	}

	@Override
	public boolean modify(QnaVO qna) {
		log.info("qna modify....." + qna);
		return mapper.update(qna) == 1; 
	}

	@Override
	public int updateQnaAnswer(QnaVO qna) {
		log.info("qna answer....." + qna);
		return mapper.updateQnaAnswer(qna);
	}

//	@Override
//	public List<QnaVO> getQnaList(String id) {
//		log.info("user qna list....." + id);
//		return mapper.getQnaList(id);
//	}
	//페이징
	@Override
	public List<QnaVO> getQnaList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(String id) {
		log.info("get total count");
		return mapper.getTotalCount(id);
	}

	@Override
	public List<QnaVO> getListWithPaging(Criteria cri) {
		log.info("getList with Cri: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int qnaDrop(String id) {
		
		return mapper.qnaDrop(id);
	}

}
