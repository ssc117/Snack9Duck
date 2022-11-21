

--회원
create table member(
    id varchar2(20) primary key,
    pwd varchar2(20),
    name varchar2(20),
    email1 varchar2(40),
    email2 varchar2(40),
    zip_code varchar2(7),
    addr1 varchar2(100),
    addr2 varchar2(100),
    addr3 varchar2(100),
    phone1 varchar2(20),
    phone2 varchar2(20),
    phone3 varchar2(20),
    useyn   char(1) default 'y', -- 활동 : y, 탈퇴 : n
    regdate date default sysdate);

--관리자
create table admin(
    workerid varchar2(20) primary key,
    workerpwd varchar2(20),
    name varchar2(40));

--제품
 create table product(
    prodnum number(5) primary key,
    name varchar2(200) default 0,
    kind char(1), -- 과자 : 1, 음료수 : 2, 커피/차 : 3, 전체 : 4
    price number(7) default 0, -- 판매가
    content varchar2(1000) default null,
    image varchar2(50) default 'default.jpg',
    detail_image varchar2(50) default 'detail_default.jpg',
    useyn char default 'y', -- 판매 : y, 판매중단 : n --X
    regdate date default sysdate);
create sequence product_seq start with 1 increment by 1;


--장바구니
create table cart(
    cartnum number(8) primary key,
    id varchar2(20),
    prodnum number(5),
    quantity number(5) default 1,
    result char(1) default '1', -- 배송 전 : 1, 배송 완료 : 2--X
    indate date default sysdate, -- 카트 담은 날짜
    constraint fk_id foreign key(id) references member(id),
    constraint fk_prodnum foreign key(prodnum) references product(prodnum),
    CONSTRAINT chk_quantity CHECK (quantity>=1));
    create sequence cart_seq start with 1 increment by 1;
--주문
create table orders(
    oseq number(10) primary key,
    id varchar2(20),
    request varchar2(100),
    indate date default sysdate,
    constraint fk_order_id foreign key(id) references member(id));
    
    create sequence orders_seq start with 1 increment by 1;
    
--주문 상세
create table order_detail(
    odseq number(10) primary key,
    oseq number(10),
    prodnum number(5),
    quantity number(5),
    result char(1) default 1, -- 배송 전 : 1, 배송 완료 : 2
    constraint fk_order_detail foreign key(oseq) references orders(oseq),
    constraint fk_prod_detail foreign key(prodnum) references product(prodnum));
    
    create sequence order_detail_seq start with 1 increment by 1;
--qna
create table qna(
    qseq number(5) primary key,
    type varchar2(100),
    subject varchar2(100),
    content varchar2(1000),
    reply varchar2(1000),
    email varchar2(50),
    id varchar2(20) references member(id),
    rep varchar2(20) default 'no',
    indate date default sysdate);

    create sequence qna_seq start with 1 increment by 1;
-- 이벤트 번호 / 이름 / 배너 이미지 / 이벤트 메인 이미지 / 이벤트 내용 / 이벤트 공지 일자 /  이벤트 관리 (1:진행중 2: 종료)
create table event(
    eventno number(5) primary key,
    subject varchar2(100),
    img varchar2(50),
    mainimg varchar2(50),
    content varchar2(500),
    indate date default sysdate,
    upload char(1) default 1
);
create sequence event_seq start with 1 increment by 1;

CREATE TABLE noticeboard(
noticeno number(5) primary key,
writer varchar(20) references admin(workerid),
title varchar(70) NULL,
content varchar2(1000),
indate date default sysdate
);
create sequence notice_seq start with 1 increment by 1;
--리뷰
create table review(
    rnum number(10) primary key, 
    id varchar2(20), 
   prodnum number(5), 
   content varchar2(200), 
   indate date default sysdate, 
    constraint fk_review_id foreign key(id) references member(id),
    constraint fk_review_prodnum foreign key(prodnum) references product(prodnum));
    create sequence review_seq start with 1 increment by 1;
    
--order_view
CREATE OR REPLACE VIEW order_view
    AS
    SELECT 
    o.odseq, o.oseq, o.result, o.quantity,
    p.id, p.indate,  p.request,
   m.name, m.email1, m.email2, m.zip_code, m.addr1, m.addr2, m.addr3,
    m.phone1, m.phone2, m.phone3,-- 회원정보
    prod.name pname, prod.prodnum, prod.kind, prod.price, prod.image --product
    FROM orders p, order_detail o, member m, product prod
    WHERE m.id = p.id 
    and prod.prodnum = o.prodnum
    and p.oseq = o.oseq
    ORDER BY o.oseq DESC;




--insert-----------------------------------------------------
--관리자 계정 insert
insert into admin(workerid,workerpwd) values('admin','1234');
-- 공지사항 insert 작성자, 제목, 내용, 작성일    
insert into noticeboard values(notice_seq.nextval,'admin', '제목1', '내용1', sysdate);
insert into noticeboard values(notice_seq.nextval,'admin', '제목2', '내용2', sysdate);
insert into noticeboard values(notice_seq.nextval,'admin', '제목3', '내용3', sysdate);

--제품insert
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '파이7종세트', '1', '25500', '7가지 파이를 만나볼 수 있어요.', 'pieset.jpg', 'pieset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '크라운 대용량 과자세트', '1', '50000', '크라운 인기과자 낱개 개별 포장으로 사무실, 학교 간식으로 좋아요.', 'crownset.jpg', 'crownset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '맛있는 오리온과자 9종세트', '1', '30000', '맛있는 오리온과자 9종세트 낱개 개별 포장으로 편리해요.', 'orionset.jpg', 'orionset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '낱개포장 대용량 사무실 간식 13종 세트', '1', '70000', '우리 사무실은 이걸로 딱! 낱개 포장으로 깔끔한 대용량 사무실 간식세트 13종!', 'workersnackset.jpg', 'workersnackset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '미스터리 간식박스 6종 세트', '1', '33333', '6가지 상품군에서 랜덤으로 발송되는 미스터리 간식박스! 한박스에 총 18종이 들어있습니다.', 'mysteryrandomset.jpg', 'mysteryrandomset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '뚱캔 탄산음료 세트', '2', '20000', '넉넉한 용량의 뚱캔 탄산음료 16가지가 들어있어요. ', '355sodaset.jpg', '355sodaset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'FraisJus 과일음료 세트', '2', '3000', '신선한 과일 향이 느껴지는 프레주 과일음료 1Set에 10개 들어있어요.', 'fraisjusset.jpg', 'fraisjusset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '랜덤 음료 세트', '2', '7777', '16가지 음료 중 운영자도 모르게 랜덤으로 10개를 전해드려요! ', 'randomset.jpg', 'randomset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'EDIYA 커피 콤부차 13종 세트', '2', '55000', 'EDIYA에서 출시한 커피, 콤부차 13종이 들어있어요. ', 'ediyaset.jpg', 'ediyaset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '캔 커피 21종 세트', '2', '22000', '아메리카노, 라떼, 콜드브루 등 다양한 종류의 캔커피 21종이 들어있어요.', 'cancoffeeset.jpg', 'cancoffeeset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'TOP 캔커피 세트', '3', '10000', '맥심의 TOP 캔커피 에스프레소, 더 블랙, 스위트 아메리카노, 스모키 라떼, 스모키 블랙이 3캔씩 15캔 들어있어요.', 'topset.jpg', 'topset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '물 대신 PET 차 16종 세트', '3', '15000', '갈증에 좋은 차 종류가 16개 들어있어요.', 'petteaset.jpg', 'petteaset_detail.jpg', DEFAULT, DEFAULT);

--이벤트insert
INSERT INTO event
VALUES(event_seq.nextval,
'슈가제로 세트 출시!',
'event01.jpg',
'event_main01.jpg',
'이벤트 기간 : 2022-09-01 ~ 2022-10-01',
sysdate,
default);

INSERT INTO event
VALUES(event_seq.nextval,
'슈가제로 세트 출시!',
'event02.jpg',
'event_main01.jpg',
'이벤트 기간 : 2022-09-01 ~ 2022-10-01',
sysdate,
default);

INSERT INTO event
VALUES(event_seq.nextval,
'슈가제로 세트 출시!02',
'event02.jpg',
'event_main01.jpg',
'이벤트 기간 : 2022-09-01 ~ 2022-10-01',
sysdate,
'2');

commit;