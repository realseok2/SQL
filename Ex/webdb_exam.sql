--  author 테이블 생성------------------------------------------------------------------------------------------------------------
create table author (
    author_id       number(10),
    author_name     varchar2(100)   not null,
    author_desc     varchar2(500),
    primary key     (author_id)
);

--  book 테이블 생성 및 author 테이블과 연결---------------------------------------------------------------------------------------
create table book (
    book_id         number(10),
    title           varchar2(100)   not null,
    pubs            varchar2(100),
    pub_date        date,
    author_id       number(10),
    primary key     (book_id),
    CONSTRAINT      c_book_fk       foreign key (author_id)
    REFERENCES      author(author_id)
);

--  author sequence 명령어 생성---------------------------------------------------------------------------------------------------
create  sequence    seq_author_id
        INCREMENT   by 1
        start with  1;
        
--  book sequence 명령어 생성-----------------------------------------------------------------------------------------------------
create  sequence    seq_book_id
        INCREMENT   by 1
        start with  1;

--  author 데이터 추가-----------------------------------------------------------------------------------------------------------
insert into author
values  (SEQ_AUTHOR_ID.nextval, '이문열', '경북 영양');

insert into author
values  (SEQ_AUTHOR_ID.nextval, '박경리', '경상남도 통영');       

insert into author
values  (SEQ_AUTHOR_ID.nextval, '유시민', '17대 국회의원');

insert into author
values  (SEQ_AUTHOR_ID.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values  (SEQ_AUTHOR_ID.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values  (SEQ_AUTHOR_ID.nextval, '이말년', '털복숭이');

--  book 데이터 추가--------------------------------------------------------------------------------------------------------------
insert into book
values  (SEQ_BOOK_ID.nextval, '우리들의 일그러진 영웅', '다림', '1998/02/22', 25);

insert into book
values  (SEQ_BOOK_ID.nextval, '삼국지', '민음사', '2002/03/01', 25);

insert into book
values  (SEQ_BOOK_ID.nextval, '토지', '마로니에북스', '2012/08/15', 26);

insert into book
values  (SEQ_BOOK_ID.nextval, '유시민의 글쓰기 특강', '생각의 길', '2015/04/01', 27);

insert into book
values  (SEQ_BOOK_ID.nextval, '패션왕', '중앙북스(books)', '2012/02/22', 28);

insert into book
values  (SEQ_BOOK_ID.nextval, '순정만화', '재미주의', '2011/08/03', 29);

insert into book
values  (SEQ_BOOK_ID.nextval, '이말년 서유기', '네이버웹툰', '2013/12/03', 30);

insert into book
values  (SEQ_BOOK_ID.nextval, '26년', '재미주의', '2012/02/04', 29);

--  author 테이블과 book 테이블 join----------------------------------------------------------------------------------------------
SELECT
    b.book_id "책아이디",
    b.title "책제목",
    b.pubs "출판사",
    to_char(b.pub_date, 'yy"년" mm"월" dd"일" day') "출판일",
    a.author_id "작가아이디",
    a.author_name "작가이름",
    a.author_desc "작가설명"
FROM book b, author a
where b.author_id = a.author_id;

--  ex01.   이말년의 author_desc 정보를 '침착맨'으로 변경해 보세요.------------------------------------------------------------------
UPDATE      author
set         author_desc = '침착맨'
where       author_id = 30;

--  ex02.   author 테이블에서 기안84 데이터를 삭제해 보세요.-------------------------------------------------------------------------
delete from     author
where           author_id = 28;
--  ORA-02292: integrity constraint (WEBDB.C_BOOK_FK) violated - child record found --> book테이블에서 fk로 사용하고 있기 때문에 삭제 불가능

--  확인용 코드-------------------------------------------------------------------------------------------------------------------
select * from book;
select * from author;

--------------------------------------------------------------------------------------------------------------------------------
--  author 데이터 전체 삭제-------------------------------------------------------------------------------------------------------
delete from     author;    

--  book 데이터 전체 삭제-------------------------------------------------------------------------------------------------------
delete from     book;

