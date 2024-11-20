
-- Class 1 Practices

create database company;
use company;

create table employee(
id int primary key,
name varchar(20) not null,
salary double not null
);
show tables;
show databases;
desc employee;


-- Add Single row in table
insert into employee values(1,"Rohit",34000);
select * from employee;

-- 2 Add multiple value in table 
insert into employee(id ,name , salary)
 values
 (3,"Lucky",31000),
 (4,"Arpit",30000);


-- Class 2 Practices
create database School;
use School;
create table students(
id int primary key,
f_name varchar(20) not null,
l_name varchar(20) not null,
dob date check(dob < sysdate()),
address text,
gender char(1) check(gender = 'M' or gender = 'F') default ('M'),
standard int check(standard >= 1 and standard <=10),
email varchar(20) unique,
mobile varchar(10) not null unique
);
insert into  students
values
(2,'Mohit','Bhagat','2002-04-2','Amravati','M',10,'def@gamil.com',5656565655)
(1,'Rohit','Mohod','2002-07-23','Nagpur','M',9,'abc@gamil.com',8989898900);

insert into  students (id,f_name,l_name,mobile) 
values
(3,'Arpit','Gayakwad',8787878787)
;

insert into students (id,f_name,l_name,mobile,dob) 
values(4,'shubhangi','kaikadi','1234567891','2023-10-12');

update  students 
set gender = 'F'
where id = 4;


select * from students;
select * from students
 where f_name like 'a%';
 
-- To find the Which student that name start as a
 select * from students
 where f_name  like 'a%';
 
--  This query retrieves all rows where the f_name column has a second character of n and any number of characters after it.
 select * from students where f_name like '_h%';
 
 
 select * From students where standard is null and email is null;
 
 
--  To Calculate the age of the  student
select id,f_name,l_name,extract(year from dob) - extract(year from sysdate()) from students;
select id,f_name,l_name,extract(year from sysdate()) - extract(year from dob) as age from students;

-- insert the data into table
insert into students(id,f_name,l_name,mobile,dob) values(5,'vishal','chaudhary','1234567897','1982-10-12');
insert into students(id,f_name,l_name,mobile,dob) values(6,'amol','johi','1234567899','1970-10-12');


-- to find the student by order in dob finding age
select id,f_name,l_name,extract(year from sysdate())-extract(year from dob) from students order by dob;

 select id,f_name,l_name,extract(year from sysdate())-extract(year from dob) from students order by dob desc limit 2;
 


 
