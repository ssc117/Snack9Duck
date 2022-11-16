package com.snack9duck.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
  private int startPage; // 시작 페이지!
  private int endPage; // 끝 페이지
  private boolean prev, next; // 이전 다음 페이지 유무 확인
  private int total; // 전체 레코드의 수
  private Criteria cri; //Criteria 객체
  public PageDTO(Criteria cri, int total) {
    this.cri = cri;
    this.total = total;
    this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
    this.startPage = this.endPage - 9;
    //실제 끝 페이지
    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); // 실제 끝페이지가 끝 페이지 보다 작으면
    if (realEnd <= this.endPage) { // 끝 페이지를 실제 끝 페이지 값으로 변경
      this.endPage = realEnd;
    }
    // 시작 페이지가 1 페이지 보다 크면 prev가 true
    this.prev = this.startPage > 1;
    // 끝 페이지가 실제 끝 페이지보다 작으면 next가 true
    this.next = this.endPage < realEnd;
  }
}
