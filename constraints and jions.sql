use  partice; 

create table constraints (id int AUTO_INCREMENT primary key   ,
name1st varchar(20) unique ,
 lastname varchar(20) not null,
 age  int check(Age>=18) ,
 palce varchar(20) DEFAULT 'UNKNOWN');

 DROP TABLE  constraints;

 CREATE INDEX idx_age 
   ON constraints ( AGE );
   
   

insert into constraints(name1st,lastname,age,PALCE) VALUES 
('PREEP','LAST',30,'DVG'),
('PRADEEP','LAST',25,default);

select* FROM constraints;

use   you_tub;

select * from  student;
select * from person ;


insert into  student values(2,'meach','do kow ',31),
(3,'doc','do kown',18);

#inner  join 
select * from  student
inner  join person on student.id = person.id;

#right  join 
select * from  student
right  join person on student.id = person.id;


#left  join 
select * from  student
 left join person on student.id = person.id;

#outer join 
select * from  student
right  join person on student.id = person.id

union

select * from  student
left  join person on student.id = person.id;

#cross  join
select student.id,student.FIRST_NAME, person.frist_name from  student
cross  join person ;

#natural jion
select * from  student natural  join person ;
#self  jion 

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (7, 'Muffy', 24, 'Indore', 10000.00 );

select* from CUSTOMERS;

SELECT a.ID, b.NAME as EARNS_HIGHER, a.NAME as EARNS_LESS, a.SALARY as LOWER_SALARY
FROM CUSTOMERS a, CUSTOMERS b
WHERE a.SALARY < b.SALARY order by  LOWER_SALARY;
