-- drop table todolist;
create table todolist
(
    id int primary key auto_increment,
    todo varchar(200) not null,
    userid varchar(12),
    write_date date,
    end_date date,
    done char(1)
);

insert into todolist(todo,userid,write_date,end_date,done)
values('영화보기','dada',curdate(),current_date()+7,'N');

insert into todolist(todo,userid,write_date,end_date,done)
values('여행계획세우기','dada',curdate(),current_date()+8,'N');

insert into todolist(todo,userid,write_date,end_date,done)
values('밤비 산책 시키기','dada',curdate(),current_date()+9,'N');

insert into todolist(todo,userid,write_date,end_date,done)
values('알고리즘/자바공부','ssafy',curdate(),current_date()+9,'N');

commit;