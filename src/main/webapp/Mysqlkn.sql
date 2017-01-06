drop table member

create table member(
idx int not null primary key auto_increment,
writer varchar(50),
rank varchar(50),
buy varchar(50),
count varchar(50),
reason varchar(50)
)engine=innoDB default charset=utf8;

select *from member

drop table items

create table items(
idx int not null primary key auto_increment,
desk varchar(50),
chair varchar(50)
)engine=innoDB default charset=utf8;