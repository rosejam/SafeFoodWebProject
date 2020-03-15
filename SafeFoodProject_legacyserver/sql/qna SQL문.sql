
create table QnA(
	num int primary key auto_increment,
    title varchar(30),
    writer varchar(10),
    wdate date,
    question varchar(1000),
    answer varchar(1000)
);

insert into QnA values(1,'dhjd','afd', curdate(), 'dfasfda sd', 'adfssdfasd');