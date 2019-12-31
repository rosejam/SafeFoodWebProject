
create table qna(
	num int primary key,
    title varchar(30),
    writer varchar(10),
    wdate date,
    question varchar(1000),
    answer varchar(1000)
);

insert into qna values(1,'dhjd','afd', curdate(), 'dfasfda sd', 'adfssdfasd');