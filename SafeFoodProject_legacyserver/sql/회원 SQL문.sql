create table `member`(id varchar(20) primary key,
pass varchar(20),
alergy varchar(500),
myfood varchar(500),
mycal double default 0.0,
weight int not null default 60
);

insert into `member` values ('admin', 'admin', 'on', null, 0, 40);
insert into `member` values ('ssafy', 'ssafy', 'on', null, 0, 80);

select * from `member`;
