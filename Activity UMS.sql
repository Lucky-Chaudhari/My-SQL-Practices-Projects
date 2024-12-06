-- SQL Activity Create University managment System

-- Problem # 1 Creating Tables -------------------------------------
Create database UMS;
use UMS;
create table student_info_LC(
reg_number varchar(15) primary key,
student_name varchar(30) not null,
branch varchar(30),
contact_number varchar(10),
date_of_birth date not null,
date_of_joining date default (sysdate()),
address varchar(250),
email_id varchar(250)
);
create table Subject_Master_LC(
Subject_Code varchar(10) primary key,
Subject_Name varchar(30) not null, 
Weightage int not null
);
create table Student_Marks_LC(
reg_number varchar(15),
Subject_Code varchar(10),
Semester int not null,
Marks int default(0),
foreign key (reg_number) references student_info_LC(reg_number),
foreign key (Subject_Code) references Subject_Master_LC(Subject_Code)
);


create table Student_Result_LC(
reg_number varchar(15),
Semester int not null,
GPA int not null,
Is_Eligible_Scholarship  char(3) default('Yes'),
foreign key (reg_number) references student_info_LC(reg_number),
primary key (reg_number,Semester)
);

-- --------------Problem # 2 Working with constraints:-------------------------------------

-- do not all repeated  entries of subjects having same name
alter  table Subject_Master_LC modify column Subject_Name 
varchar(30) not null unique;

-- b)	Create a constraint which does not allow two students having the same Contact Number.
alter  table student_info_LC modify column contact_number
varchar(30) not null unique;


-- c)	Create a constraint which does not allow date of birth after date of joining.
alter table student_info_LC add constraint  dob_check  check(date_of_birth<date_of_joining);

-- d)	Create a constraint that does not allow value greater than 100 be inserted into Marks.
alter table Student_Marks_LC add constraint Marks_checking  check(marks<=100);


-- e)	Create a constraint which mandates GPA values to be less than or equal to 10.
alter table Student_Result_LC add constraint  GPA_check  check (GPA between 1 and 10);


-- f)	Create a constraint which mandates that value for  Is_Eligible_Scholarship is either ‘Y’ or ‘N’.
alter table Student_Result_LC modify column Is_Eligible_Scholarship  char constraint  Eligible_check CHECK (Is_Eligible_Scholarship IN ('Y', 'N')) default('Y');


----------------------- Problem # 3  Loading tables using DML:  ----------------------------------

-- a)	Load student information into Student_Info table. 


INSERT INTO student_info_LC VALUES
('MC101301', 'James', 'MCA', '9714589787', STR_TO_DATE('12-jan-1984', '%d-%b-%Y'), STR_TO_DATE('08-jul-2010', '%d-%b-%Y'), 'No 10 South Block,Nivea', 'james.mca@yahoo.com'),
('BEC111402', 'Manio', 'ECE', '8912457875', STR_TO_DATE('23-feb-1983', '%d-%b-%Y'), STR_TO_DATE('25-jun-2011', '%d-%b-%Y'), '8/12,Park View,Sieera', 'manioma@gmail.com'),
('BEEI101204', 'Mike', 'EI', '8974567897', STR_TO_DATE('10-feb-1983', '%d-%b-%Y'), STR_TO_DATE('25-aug-2010', '%d-%b-%Y'), 'Cross villa,NY', 'mike.james@ymail.com'),
('MB111305', 'Paulson', 'MBA', '8547986123', STR_TO_DATE('13-dec-1984', '%d-%b-%Y'), STR_TO_DATE('08-aug-2010', '%d-%b-%Y'), 'Lake view,NJ', 'paul.son@rediffmail.com'),
('MB222305', 'Pradeep', 'MBA', '8239947383', STR_TO_DATE('13-dec-1984', '%d-%b-%Y'), STR_TO_DATE('08-aug-2011', '%d-%b-%Y'), 'Warje Pune', NULL);


select * from student_info_LC;


-- b)	Load information on subjects into Subject_Master table.-----------

insert into Subject_Master_LC values
('EE01DCF','DCF',30),
('EC02MUP','Microprocessor',40), 
('MC06DIP','Digital Image Processing',30),
('MB03MAR','Marketing Techniques',20),
('EI05IP','Instrumentation Precision',40),
('CPSC02DS','Data Structures',40);
select * from Subject_Master_LC;



-- c)	Load marks obtained by students in each subject in each semester into Student_Marks table.
												
INSERT INTO STUDENT_MARKS_LC VALUES('MC101301','EE01DCF',	1,	75);
INSERT INTO STUDENT_MARKS_LC VALUES('MC101301','EC02MUP',	1,	65);
INSERT INTO STUDENT_MARKS_LC VALUES('MC101301','MC06DIP',	1,	70);
INSERT INTO STUDENT_MARKS_LC VALUES('BEC111402','EE01DCF',	1,	55);
INSERT INTO STUDENT_MARKS_LC VALUES('BEC111402','EC02MUP',	1,	80);
INSERT INTO STUDENT_MARKS_LC VALUES('BEC111402','MC06DIP',	1,	60);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','EE01DCF',	1,	85);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','EC02MUP',	1,	78);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','MC06DIP',	1,	80);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','MB03MAR',	2,	75);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','EI05IP',	2,	65);
INSERT INTO STUDENT_MARKS_LC VALUES('BEEI101204','CPSC02DS',    2,	75);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','EE01DCF',	1,	65);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','EC02MUP',	1,	68);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','MC06DIP',	1,	63);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','MB03MAR',	2,	85);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','EI05IP',	2,	74);
INSERT INTO STUDENT_MARKS_LC VALUES('MB111305','CPSC02DS',      2,	62);

select * From  Student_Marks_LC;


-- d)	Load the GPA of the student obtained in each semester into Student_Result table along with the information whether the student is eligible for scholarship or not.	

INSERT INTO STUDENT_RESULT_LC VALUES('MC101301',1,7.5,'Y');
INSERT INTO STUDENT_RESULT_LC VALUES('BEC111402',1,7.1,'Y');
INSERT INTO STUDENT_RESULT_LC VALUES('BEEI101204',1,8.3,'Y');
INSERT INTO STUDENT_RESULT_LC VALUES('BEEI101204',2,6.9,'N');
INSERT INTO STUDENT_RESULT_LC VALUES('MB111305',1,6.5,'N');
INSERT INTO STUDENT_RESULT_LC VALUES('MB111305',2,6.8,'N');
select * from Student_Result_LC;

-- SET SQL_SAFE_UPDATES = 1;
-- SET FOREIGN_KEY_CHECKS = 1;

-- Problem # 4 Perform the following operations
-- a)	Change the registration number of the James as MC101212.
UPDATE student_info_LC 
SET reg_number = 'MC101212'
 WHERE student_name = 'James';
 select * from student_info_LC ;

-- b)	Change the subject code for the subject Data structures as DS0112.
update Subject_Master_LC
 set Subject_Code='DS0112'
 where Subject_Name='Data Structures';
select * from Subject_Master_LC;

-- c)	Enter details of a new subject into table Subject_Master_<employee_id> without weightage. What is the output you noticed?

INSERT INTO subject_master_lc (subject_code, subject_name,Weightage)
VALUES ('MM2345', 'Mathematics',0);
select * from  subject_master_lc;

-- d)	Change the contact number of Paulson as 8912457875.
update student_info_LC
set contact_number ='8912457875'
where student_name='Paulson';

select * from  student_info_LC;
-- The Error Code: 1062 indicates that you are trying to update the contact_number column with a value (8912457875) that already exists in another row, and the contact_number column has a UNIQUE constraint. This prevents duplicate values in the contact_number field.

-- e)	Change the marks for James for DCF subject as 120. What is the output you noticed?
       -- MC101212
select reg_number from student_info_lc where student_name='James';
select subject_code from subject_master_lc where subject_name='DCF';
        -- EE01DCF
        
 update  STUDENT_MARKS_LC
 set  marks =120
 where reg_number=(select reg_number from student_info_lc where student_name='James')and 
      subject_code= (select subject_code from subject_master_lc where subject_name='DCF');
       select * From STUDENT_MARKS_LC;
       select * from student_info_lc;
       
       
       
       

-- f)	Change the GPA for Mike as 11. What is the output you noticed?
    
select reg_number from student_info_lc where student_name='Mike';
update student_result_lc
 set gpa=11 
 where reg_number=(select reg_number from student_info_lc where student_name='Mike');
 
--  0	121	12:49:05	update student_result_lc set gpa=11 
--  where reg_number=(select reg_number from student_info_lc where student_name='Mike')	Error Code: 3819. Check constraint 'GPA_check' is violated.	0.000 sec


-- SQL Activity 3 Hands-on Exercise Objective
-- ----------------

-- 1.	Write a query which fetches and displays all the students who have an email id
  
  select * from student_info_lc 
  where email_id is not null;
 --  output:-
--  BEC111402	Manio	ECE	8912457875	1983-02-23	2011-06-25	8/12,Park View,Sieera	manioma@gmail.com
-- BEEI101204	Mike	EI	8974567897	1983-02-10	2010-08-25	Cross villa,NY	mike.james@ymail.com
-- MB111305	Paulson	MBA	8547986123	1984-12-13	2010-08-08	Lake view,NJ	paul.son@rediffmail.com
-- MC101212	James	MCA	9714589787	1984-01-12	2010-07-08	No 10 South Block,Nivea	james.mca@yahoo.com
							
  
  
--   2.	Write a query which displays the number of students in each branch.
select  branch,count(reg_number) as no_of_students
 from student_info_lc
group by branch;
-- output:-
-- ECE	1
-- EI	1
-- MBA	2
-- MCA	1

-- 3.	Write a query which displays the marks and register number of all students who has scored marks > 50% 
select reg_number,marks from student_marks_lc where marks>=50;
-- output:-
-- MC101301 	75
-- MC101301	    65
-- MC101301	   70
-- BEC111402	55
-- BEC111402	80
-- BEC111402	60
-- BEEI101204	85
-- BEEI101204	78
-- BEEI101204	80
-- BEEI101204	75
-- BEEI101204	65
-- BEEI101204	75
-- MB111305 	65
-- MB111305 	68
-- MB111305	    63
-- MB111305 	85
-- MB111305 	74
-- MB111305  	62

-- 4.	Write a query which displays the student name, registration number and their GPA in descending order of GPA.
select 
si.reg_number,si.student_name,sr.gpa from student_info_lc si join student_result_lc sr on
si.reg_number= si.reg_number order by sr.gpa desc;

           -- output
--   MC101212	James	8
-- MB222305 	Pradeep	8
-- MB111305   	Paulson	8
-- BEEI101204	Mike	8
-- BEC111402	Manio	8
-- MC101212	    James	7
-- MB222305 	Pradeep	7
-- MB111305	   Paulson	7
-- BEEI101204	Mike	7
-- BEC111402	Manio	7
-- MC101212	    James	7
-- MB222305 	Pradeep	7
-- MB111305	    Paulson	7
-- BEEI101204	Mike	7
-- BEC111402	Manio	7
-- MC101212	     James	7
-- MB222305	   Pradeep	7
-- MB111305	   Paulson	7
-- BEEI101204	Mike	7
-- BEC111402	Manio	7
-- MC101212 	James	7
-- MB222305	  Pradeep	7
-- MB111305	 Paulson	7
-- BEEI101204	Mike	7

-- 5.	Write a query which displays the student information in ascending order of the student’s name.
select * from student_info_lc order by student_name;

-- 6.	Write a query which displays the information of students in ascending order of their age.

select si.reg_number,si.student_name,si.date_of_birth,extract(year 
from sysdate())-extract(year from date_of_birth) as 
age from student_info_lc si order by date_of_birth;

-- 7.	Write a query which will retrieve the registration number, student name, subject name , semester # and the respective marks of the subject.
select si.reg_number,si.student_name,sb.subject_name,sm.semester,sm.marks
 from student_info_lc si join subject_master_lc sb join
 student_marks_lc sm on si.reg_number=sm.reg_number and sb.subject_code=sm.subject_code;
 
--  8.	Write a query which displays the student’s registration number, student name, marks and semester# for all semesters ordered by  registration number and  semester#.

select si.reg_number,si.student_name,sb.subject_name,sm.semester,sm.marks 
from student_info_lc si join subject_master_lc sb join student_marks_lc sm 
on si.reg_number=sm.reg_number and sb.subject_code=sm.subject_code 
order by si.reg_number,sm.semester;


-- 9.	Write a query to display the student name , registration number , subject code, subject name, marks and semester # of all the students who have scored more than 50%. 

select si.reg_number,si.student_name,concat(sb.subject_code,' - ',sb.subject_name) 
as Sub_Details,sm.semester,sm.marks from student_info_lc si join subject_master_lc sb
 join student_marks_lc sm on si.reg_number=sm.reg_number and sb.subject_code=sm.subject_code
 where sm.marks>50;
 
--  10.	Write a query to display the registration number and GPA of each student in such a way that the students who are eligible for scholarship are displayed first.
 select reg_number,gpa,is_eligible_scholarship 
 from student_result_lc order by is_eligible_scholarship desc; 