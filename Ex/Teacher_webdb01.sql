--  webdb   2020년 06월 12일 webdb 1일차
--------------------------------------------------------------------------------------------------------------------------------whole
--  계정 전체 테이블 보기
SELECT
    *
FROM tabs;

--  테이블 생성
create table book (
    book_id     number(5),
    title       varchar2(50),
    author      varchar2(10),
    pub_date    date
);
--------------------------------------------------------------------------------------------------------------------------------column
--  컬럼 추가
alter table book add (
    pubs        varchar2(50)
);

--  컬럼 수정 (자료형 변경)
alter table book modify (
    title varchar2(100)
);

--  컬럼 수정 (컬럼명 변경)
alter table book rename column title to subject;

--  컬럼 삭제
alter table book drop (
    author
);
--------------------------------------------------------------------------------------------------------------------------------table
--  테이블명 수정
rename book to article;

--  테이블 삭제
--drop table article;

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

--  author(작가) 테이블 생성------------------------------------------------------------------------------------------------------테이블 생성
create table author (
    author_id       number(10),
    author_name     varchar2(100)    not null,
    author_desc     varchar2(500),
    PRIMARY KEY     (author_id)
);

--  book(책) 테이블 생성
create table book (
    book_id     number(10),
    title       varchar2(100)   not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    primary key (book_id),
    CONSTRAINT  c_book_fk       foreign key (author_id)
    REFERENCES  author(author_id)
);

--  author(작가) 데이터 추가------------------------------------------------------------------------------------------------------데이터 추가
insert into author 
values   (1, '박경리', '토지작가');

insert into author (author_id, author_name)
values  (2, '이문열');

insert into author
values  (3, '주호민', '');

--  author(작가) 데이터 수정------------------------------------------------------------------------------------------------------데이터 수정
update  author
set     author_desc = '신과함께작가'
where   author_id = 3;----------------------------> 중요!! 어느자리 데이터를 바꿀 것인지 반드시 지정을 해줘야합니다.

update  author
set     author_name = '이말년',
        author_desc = '와장창'
where   author_id = 3;----------------------------> 중요!! where절을 안써주면 데이터 전체가 변경이 됩니다. 조심하세요!!!!!!!!!!!!!!!!

--  author(작가) 데이터 삭제------------------------------------------------------------------------------------------------------데이터 삭제
delete from     author
where           author_id = 1;

delete from     author
where           author_name = '이문열';

--  author(작가) 테이블 sequence(시퀀스) 생성
create  SEQUENCE    seq_author_id
        INCREMENT   by 1
        start with  1;

--  author(작가) 데이터 전체 삭제 -------------------> 조심!!!!!
delete from author;

--  author(작가) 정보 추가
insert into author
values      (SEQ_AUTHOR_ID.nextval, '박경리', '토지작가');

insert into author  (author_id, author_name)-------------->2번을 강제로 집어넣음
values              (2, '이문열');

insert into author  (author_id, author_name)
values              (SEQ_AUTHOR_ID.nextval, '이문열');----->위에서 2번을 강제로 집어넣었기 때문에 오류 발생 but 툭 쳐서 한번 더 실행하면 3번으로 출력



SELECT * FROM author;-----------------------------------------------------------------------------------------------------------author 테이블 전체 확인

--  sequence(시퀀스) 명령어-------------------------------------------------------------------------------------------------------시퀀스 명령어
SELECT * FROM user sequence;
SELECT seq_author_id.currval from dual;
select seq_author_id.nextval from dual;

drop sequence seq_author_id;                            -- 자신이 설정한 시퀀스 명령어 삭제

--  sysdate 사용예제-------------------------------------------------------------------------------------------------------------sysdate 예제
insert into book
values  (1, '하이 첫째글', '본문내용ㅋㅋ', sysdate, 1);

select 
    book_id,
    title,
    pubs,
    pub_date,
    b.author_id,
    a.author_name
from book b, author a
where b.author_id = a.author_id;-------------------------------------------------------------------------------------------------------------book 테이블 전체 확인