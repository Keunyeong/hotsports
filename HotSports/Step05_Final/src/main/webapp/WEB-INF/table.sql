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