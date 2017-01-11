drop table request

create table member(
idx int not null primary key auto_increment,
name varchar(20),
rank varchar(20),
years varchar(20)
)


create table request(
idx int not null primary key auto_increment,
writer varchar(50),
rank varchar(50),
buy varchar(50),
count varchar(50),
reason varchar(50),
money int
)engine=innoDB default charset=utf8;

select *from request

drop table items

create table items(
idx int not null primary key auto_increment,
desk int,
chair int
)engine=innoDB default charset=utf8;

select *from items

insert into items(desk) values('0');
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