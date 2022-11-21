

--ȸ��
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
    useyn   char(1) default 'y', -- Ȱ�� : y, Ż�� : n
    regdate date default sysdate);

--������
create table admin(
    workerid varchar2(20) primary key,
    workerpwd varchar2(20),
    name varchar2(40));

--��ǰ
 create table product(
    prodnum number(5) primary key,
    name varchar2(200) default 0,
    kind char(1), -- ���� : 1, ����� : 2, Ŀ��/�� : 3, ��ü : 4
    price number(7) default 0, -- �ǸŰ�
    content varchar2(1000) default null,
    image varchar2(50) default 'default.jpg',
    detail_image varchar2(50) default 'detail_default.jpg',
    useyn char default 'y', -- �Ǹ� : y, �Ǹ��ߴ� : n --X
    regdate date default sysdate);
create sequence product_seq start with 1 increment by 1;


--��ٱ���
create table cart(
    cartnum number(8) primary key,
    id varchar2(20),
    prodnum number(5),
    quantity number(5) default 1,
    result char(1) default '1', -- ��� �� : 1, ��� �Ϸ� : 2--X
    indate date default sysdate, -- īƮ ���� ��¥
    constraint fk_id foreign key(id) references member(id),
    constraint fk_prodnum foreign key(prodnum) references product(prodnum),
    CONSTRAINT chk_quantity CHECK (quantity>=1));
    create sequence cart_seq start with 1 increment by 1;
--�ֹ�
create table orders(
    oseq number(10) primary key,
    id varchar2(20),
    request varchar2(100),
    indate date default sysdate,
    constraint fk_order_id foreign key(id) references member(id));
    
    create sequence orders_seq start with 1 increment by 1;
    
--�ֹ� ��
create table order_detail(
    odseq number(10) primary key,
    oseq number(10),
    prodnum number(5),
    quantity number(5),
    result char(1) default 1, -- ��� �� : 1, ��� �Ϸ� : 2
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
-- �̺�Ʈ ��ȣ / �̸� / ��� �̹��� / �̺�Ʈ ���� �̹��� / �̺�Ʈ ���� / �̺�Ʈ ���� ���� /  �̺�Ʈ ���� (1:������ 2: ����)
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
--����
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
    m.phone1, m.phone2, m.phone3,-- ȸ������
    prod.name pname, prod.prodnum, prod.kind, prod.price, prod.image --product
    FROM orders p, order_detail o, member m, product prod
    WHERE m.id = p.id 
    and prod.prodnum = o.prodnum
    and p.oseq = o.oseq
    ORDER BY o.oseq DESC;




--insert-----------------------------------------------------
--������ ���� insert
insert into admin(workerid,workerpwd) values('admin','1234');
-- �������� insert �ۼ���, ����, ����, �ۼ���    
insert into noticeboard values(notice_seq.nextval,'admin', '����1', '����1', sysdate);
insert into noticeboard values(notice_seq.nextval,'admin', '����2', '����2', sysdate);
insert into noticeboard values(notice_seq.nextval,'admin', '����3', '����3', sysdate);

--��ǰinsert
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '����7����Ʈ', '1', '25500', '7���� ���̸� ������ �� �־��.', 'pieset.jpg', 'pieset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'ũ��� ��뷮 ���ڼ�Ʈ', '1', '50000', 'ũ��� �α���� ���� ���� �������� �繫��, �б� �������� ���ƿ�.', 'crownset.jpg', 'crownset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '���ִ� �����°��� 9����Ʈ', '1', '30000', '���ִ� �����°��� 9����Ʈ ���� ���� �������� ���ؿ�.', 'orionset.jpg', 'orionset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '�������� ��뷮 �繫�� ���� 13�� ��Ʈ', '1', '70000', '�츮 �繫���� �̰ɷ� ��! ���� �������� ����� ��뷮 �繫�� ���ļ�Ʈ 13��!', 'workersnackset.jpg', 'workersnackset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '�̽��͸� ���Ĺڽ� 6�� ��Ʈ', '1', '33333', '6���� ��ǰ������ �������� �߼۵Ǵ� �̽��͸� ���Ĺڽ�! �ѹڽ��� �� 18���� ����ֽ��ϴ�.', 'mysteryrandomset.jpg', 'mysteryrandomset_detail.jpg', DEFAULT, DEFAULT);

INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '��ĵ ź������ ��Ʈ', '2', '20000', '�˳��� �뷮�� ��ĵ ź������ 16������ ����־��. ', '355sodaset.jpg', '355sodaset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'FraisJus �������� ��Ʈ', '2', '3000', '�ż��� ���� ���� �������� ������ �������� 1Set�� 10�� ����־��.', 'fraisjusset.jpg', 'fraisjusset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '���� ���� ��Ʈ', '2', '7777', '16���� ���� �� ��ڵ� �𸣰� �������� 10���� ���ص����! ', 'randomset.jpg', 'randomset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'EDIYA Ŀ�� �޺��� 13�� ��Ʈ', '2', '55000', 'EDIYA���� ����� Ŀ��, �޺��� 13���� ����־��. ', 'ediyaset.jpg', 'ediyaset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'ĵ Ŀ�� 21�� ��Ʈ', '2', '22000', '�Ƹ޸�ī��, ��, �ݵ��� �� �پ��� ������ ĵĿ�� 21���� ����־��.', 'cancoffeeset.jpg', 'cancoffeeset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, 'TOP ĵĿ�� ��Ʈ', '3', '10000', '�ƽ��� TOP ĵĿ�� ����������, �� ��, ����Ʈ �Ƹ޸�ī��, ����Ű ��, ����Ű ���� 3ĵ�� 15ĵ ����־��.', 'topset.jpg', 'topset_detail.jpg', DEFAULT, DEFAULT);
INSERT INTO product(prodnum, name, kind, price, content, image, detail_image, useyn, regdate)
        values(product_seq.nextval, '�� ��� PET �� 16�� ��Ʈ', '3', '15000', '������ ���� �� ������ 16�� ����־��.', 'petteaset.jpg', 'petteaset_detail.jpg', DEFAULT, DEFAULT);

--�̺�Ʈinsert
INSERT INTO event
VALUES(event_seq.nextval,
'�������� ��Ʈ ���!',
'event01.jpg',
'event_main01.jpg',
'�̺�Ʈ �Ⱓ : 2022-09-01 ~ 2022-10-01',
sysdate,
default);

INSERT INTO event
VALUES(event_seq.nextval,
'�������� ��Ʈ ���!',
'event02.jpg',
'event_main01.jpg',
'�̺�Ʈ �Ⱓ : 2022-09-01 ~ 2022-10-01',
sysdate,
default);

INSERT INTO event
VALUES(event_seq.nextval,
'�������� ��Ʈ ���!02',
'event02.jpg',
'event_main01.jpg',
'�̺�Ʈ �Ⱓ : 2022-09-01 ~ 2022-10-01',
sysdate,
'2');

commit;