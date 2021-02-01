-- member
create table Member (
                        mno int primary key auto_increment,
                        name varchar(20) not null,
                        jumin varchar(14) not null,
                        userid varchar(16) not null,
                        passwd varchar(16) not null,
                        zipcode varchar(7) not null,
                        addr1 varchar(50) not null,
                        addr2 varchar(50) not null,
                        email varchar(50) not null,
                        phone varchar(13) not null,
                        regdate timestamp default current_timestamp
);

-- CRUD
insert  into Member(name,jumin,userid,passwd,zipcode,addr1,addr2,email,phone)
values (?,?,?,?,?,?,?,?,?);

-- board 테이블 만들기
create table Board(
    bno int primary key auto_increment,
    title varchar(100) not null,
    userid varchar(16) not null,
    regdate timestamp default current_timestamp,
    views int default 0,
    thumbs int default 0,
    contents text not null
);

-- crud
insert into Board (title, userid,contents) values('어빙이 짱','imlsw96','asdfasdf');


select bno,title,userid,regdate,thumbs,views from Board
order by bno desc;

select * from Board where bno =1;

update Board
set title  ='~',contents='~',regdate=current_timestamp()
where bno ='?'

delete from Board where bno=1;

-- reply 댓글
create table Reply (
    rno int primary key auto_increment,
    cno int not null,
    bno int not null,
    reply text not null,
    userid varchar(16) not null,
    regdate timestamp default current_timestamp
);

alter table Reply add constraint fk_mr
    foreign key (userid) references Member(userid);
-- 비식별키를 이용한 외래키

alter table Reply add constraint fk_br
    foreign key (bno) references Board(bno);
-- 식별키를 이용한 외래키

-- insert
insert into Reply(cno,bno,userid,reply) values(1,242,'user1','오늘은 날씨가...');
insert into Reply(cno,bno,userid,reply) values(2,242,'user2','오늘은 점심은....');
insert into Reply(cno,bno,userid,reply) values(3,242,'user2','월요병이 도졌나......');
insert into Reply(cno,bno,userid,reply) values(1,242,'user10','비가 올거 같아요 ...');
insert into Reply(cno,bno,userid,reply) values(5,242,'user2','오늘은 점심은....');

-- select

select * from Reply where bno = 242
order by cno;

-- 데이터 추가시의 반영될 auto_increment값 조회
select auto_increment from information_schema.TABLES where TABLE_NAME='Reply';