drop table request


select * from request limit 0,3 

create table request(
idx int not null primary key auto_increment,
writer varchar(50),
rank varchar(50),
buy varchar(50),
count varchar(50),
reason varchar(50),
state varchar(50),
money int,
start int
)engine=innoDB default charset=utf8;

select * from request limit 0,3 

select *from request

drop table items

create table items(
idx int not null primary key auto_increment,
desk int,
chair int
)engine=innoDB default charset=utf8;

select *from items

insert into items(desk,chair) values('0','0');
insert into items(chair) values('0');

update items set desk = desk+1 where idx=1

delete from member where idx="1";

create table money(
idx int not null primary key auto_increment,
money int,
asset int,
borrow int
)engine=innoDB default charset=utf8;

select *from money
drop table money
select * from money where idx=1
insert into money(money,asset,borrow) values('2000000','3000000','1000000');

insert into money(money,asset,borrow) values(#{money},#{asset},#{borrow});
chair = chair+${count}
update money set money= 2000, asset= 1000,borrow= 2000 where idx=1

update money set money= money+#{money}, asset= asset+#{asset},borrow= borrow+#{borrow} where idx=1
select * from member where idx='1'
drop table member
create table member(
idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(20) not null,
rank varchar(50),
years int not null
)engine=innoDB default charset=utf8;

insert into member(name,rank,years) values('이경남','과장',5);
insert into member(name,rank,years) values('이경남','과장',5);
insert into member(name,rank,years) values('이경남','과장',5);
select *from member
select * from member where name='이경남'
