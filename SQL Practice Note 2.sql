-- 1 Create the Employee Managment System Database

create database EMS;
use EMS;

-- 2 Then we Have to Create the Two Table for in Database Dept and EMP And Insert the data

-- Dept Table  
create table Dept(
id int primary key,
name varchar(30)
);
-- Insert the Data into Dept Table
insert into Dept(id,name)
 values
 (101,'IT'),
 (201,'Sales'),
 (301,'Accounts'),
 (401,'Support'),
 (501,'Purchase');
 
--  To see the table Data  we are  Command
select * from Dept;


-- Create Employee table
create table Emp(
id int primary key,
fname varchar(30) not null,
lname varchar(30) not null,
salary double,
dept_id int,  
mgr_id int,
city varchar(20),
dob  date,
doj  date,
mobile varchar(10) unique not null,
email  varchar(30) unique not null,
foreign key(dept_id) references dept(id)
);


-- Add Gender Column in Table To use Alter Command
alter table Emp add column gender char(1) default('M') check(gender in ('M','F'));

desc Emp;



-- Remove the coloumn we use drop
alter table Emp drop column city;
alter table Emp add column city varchar(20);



-- insert the info into Emp Table

insert into Emp (id,fname,lname,salary,mobile,email,dept_id) values
(1,'Amol','Kale',23000,'8149987651','amol@gmail.com',101),
(2,'Pradeep','Kale',23000,'8149987652','pradeep@gmail.com',101),
(3,'Sumit','Kale',53000,'8149987653','sumit@gmail.com',101),
(4,'Ameya','Kale',23000,'8149987654','ameya@gmail.com',201),
(5,'Virat','Kale',83000,'8149987655','virat@gmail.com',201),
(6,'Amol','Kale',23000,'8149987656','amol1@gmail.com',301),
(7,'Viru','Kale',43000,'8149987657','viru@gmail.com',301),
(8,'Amol','Kale',23000,'8149987658','amol2@gmail.com',401),
(9,'Mohan','Kale',63000,'8149987659','mohan@gmail.com',401),
(10,'Devansh','Kale',73000,'8149987650','devansh@gmail.com',501);

select * from Emp;

-- Can not delete or update a parent row  it give error
delete from dept where id=101;
update dept set id=11 where id=101;
insert into Emp(id,fname,lname,salary,mobile,email,dept_id) values
(11,'Sachin','Tendulkar',40000,'7149987651','sachin@gmail.com',701);

-- How to use Opertors (=,<,<=,>,>=, AND,OR,IN,BETWEEN,NOT)
select * from Emp where salary>=10000 AND salary<=50000;
select * from Emp where dept_id=201 OR dept_id=301 OR dept_id=101;
select * from emp where dept_id in (201,101);
select dept_id from emp;

-- Distinct is use to remove the duplication data 
select distinct dept_id from emp;


select * from emp where fname like 'a%';

select * from emp where fname not like 'a%';

select * from emp where fname like '%n';


-- Aggregate functions
select count(id) from Emp;
select sum(salary) from emp;
select min(salary) from emp;
select max(salary) from emp;
select avg(salary) from emp;

-- We have use Group By Clause with condition

 select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id;
 select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having max(salary)>50000;

select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having max(salary)<50000;

select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having count(id)=2;









