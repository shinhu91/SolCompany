create table member(
idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
id varchar(20) not null,
password varchar(20) not null,
password2 varchar(20) not null,
birth int not null
)

select id,password from member where id ="a"
insert into member(id,password,password2,birth) values("a","a","a",1)
select *from member;
drop table member;
