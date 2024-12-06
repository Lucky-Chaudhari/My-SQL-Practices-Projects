create database VMT;
use VMT;


-- create the Two table  course and students
create table course
(id int primary key ,
name varchar(30),
price float
);

-- insert Data into Course
insert into  course values
(101,'Java',10000),
(102,'Web Programming',20000),
(103,'React',30000),
(104,'Angular',40000),
(105,'DevOps',50000),
(106,'.Net',60000);

select * from course ;


-- -------------Create Student Table------------
drop table student;
create table student
(id int primary key,
name varchar(20),
 cid int,
 foreign key(cid) references course(id)
 on delete cascade
on update cascade
 );
 
insert into student values
(1,'Amol',101),
(2,'Sachin',101),
(3,'Sumit',102),
(4,'Rajesh',103),
(5,'Devansh',103),
(6,'Sumit',104);

select * from student;
select * from course ;


-- add new student

insert into student values(7,'Amol',105);
delete from course where id=101;
update course set id =105  where id = 101;

select id,name,ifnull(cid,'Not enrolled for ny course') from student;
select id,name,coalesce(cid,'Not enrolled for ny course') from student;

-- -------- Joins -------
select s.id,s.name,c.id,c.name,c.price from student s join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s inner join course c on c.id=s.cid;

-- Left join /  Left Outer Join
select s.id,s.name,c.id,c.name,c.price from student s left join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s left outer join course c on c.id=s.cid;

-- Right join /  Right Outer Join

select s.id,s.name,c.id,c.name,c.price from student s right join course c on c.id=s.cid;

select s.id,s.name,c.id,c.name,c.price from student s right outer join course c on c.id=s.cid;

-- Self Join
use ems;
update emp set mgr_id=2 where id>=7;
update emp set mgr_id=1 where id=5 or id=6;
update emp set mgr_id=3 where id=2;
update emp set mgr_id=8 where id=4;
select e.id, concat(e.fname,' ',e.lname) as emp_name,e.mgr_id,concat(m.fname,' ',m.lname) as mgr_name from emp e join emp m on e.mgr_id=m.id;
