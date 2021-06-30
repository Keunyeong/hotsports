### 사용자(회원) 정보를 저장할 테이블

create table users(
id varchar2(100) primary key,
pwd varchar2(100) not null,
email varchar2(100),
profile varchar2(100),  - 프로필 이미지 경로를 저장할 칼럼
regdate date  - 가입일
);

create table board_cafe(
	num number primary key, --글 번호
	writer varchar2(100) not null, --작성자(로그인된 아이디)
	title varchar2(100) not null, --제목
	content CLOB, -- 글내용
	viewCount number, -- 조회수
	regdate date -- 글 작성일
);

create sequence board_cafe_seq;

create table note(
	num number primary key, --글 번호
	writer varchar2(100) not null, --작성자(로그인된 아이디)
	categorize varchar2(100) not null, --기술 카테고리
	title varchar2(100) not null, --제목
	content CLOB, -- 글내용
	viewCount number, -- 조회수
	regdate date -- 글 작성일
);

create sequence note_seq;

SELECT *
FORM
	(SELECT num,title,writer,
	LAG(num,1,0) OVER(ORDER BY num DESC) AS prevNum,
	LEAD(num,1,0) OVER(ORDER BY num DESC) nextNum,
	FORM board_cafe,
	ORDER BY num DESC;)
WHERE num=381;

create table board_file(
	num number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varcahr2(100) not null,
	saveFileName varchar2(100) not null,
	filesize number not null,
	regdate date
	);
	
create sequence board_file_seq;

CREATE TABLE board_cafe_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE board_cafe_comment_seq;