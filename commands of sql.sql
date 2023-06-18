# type  commands in  mysql  
## ddl ,dml ,dcl,dql,tcl
#https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands


## DDL 
#CREATE  caluse 
 CREATE DATABASE IF NOT EXISTS PARTICE;
 USE PARTICE;
 
 
 CREATE table if not exists   new_1 (id  int  not null , first_name varchar(20) unique , last_name  varchar(25) );
 
 
 
 create OR REPLACE  view view_1 as #condition 
 select * from new_1;
 
 
 
 CREATE INDEX  index_1  ON new_1 (Last_Name,first_name);
 

#FUNCTION
DELIMITER //
#This statement changes the delimiter to // so that the function can contain multiple statements.

CREATE   FUNCTION Add_Numbers(a INT, b INT)
#this line declares the function named AddNumbers that takes two integer parameters a and b.

RETURNS INT
 #This statement specifies that the function will return an integer value.
DETERMINISTIC
#This is an  keyword that indicates that the function always returns the same result for the same input.
#https://youtu.be/iyA_P8Ppn-w  
# top link is to  understand 
BEGIN
#These keywords enclose the body of the function.
    DECLARE result INT;
    #This statement declares a variable named result of type INT.
    SET result = a + b;
    #This line assigns the sum of a and b to the result variable.
    RETURN result;
    #This statement returns the value of the result variable.
END //

DELIMITER ;
#This sets the delimiter back to the default 

SELECT Add_Numbers(2, 3);
# to  check result

DELIMITER //

CREATE FUNCTION add_strings(str1 VARCHAR(255), str2 VARCHAR(255))
RETURNS VARCHAR(510)
DETERMINISTIC

BEGIN
    DECLARE result VARCHAR(510);
    SET result = CONCAT(str1, str2);
    RETURN result;
END //

select add_strings('pradeep ','h m')as full_name ;


#https://www.javatpoint.com/mysql-stored-function
DELIMITER ;



DELIMITER //


DELIMITER &&  
CREATE PROCEDURE  PROCEDURE1()  
BEGIN  
    SELECT * FROM new_1 WHERE id = 1;  

END &&  
DELIMITER ; 






call PROCEDURE1();

#https://www.javatpoint.com/mysql-create-trigger


CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
); 

INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);

DELIMITER //  
Create Trigger before_insert_empworkinghours   
BEFORE INSERT ON employee FOR EACH ROW  
BEGIN  
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
END IF;  
END // 
DELIMITER ;
	
select * from   employee;

INSERT INTO employee VALUES    
('Alexander', 'Actor', '2020-10-012', -13); 


#drop  caluse 

DROP TABLE new_1;
drop view view_1;
DROP Trigger before_insert_empworkinghours;
DROP procedure PROCEDURE1;
DROP function Add_Numbers;
DROP DATABASE mydb;




# alter  caluse 

ALTER TABLE new_1
ADD marks  int; 
select  * from  new_1;

ALTER TABLE new_1
DROP COLUMN marks;

ALTER TABLE new_1
RENAME COLUMN id to cid;

ALTER TABLE new_1
MODIFY COLUMN cid varchar(20);

aLTER TABLE new_1
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

DELIMITER //

CREATE or  alter  FUNCTION add_strings(str1 VARCHAR(255), str2 VARCHAR(255))
RETURNS VARCHAR(510)
DETERMINISTIC

BEGIN
    DECLARE result VARCHAR(510);
    SET result = CONCAT(str1, str2);
    RETURN result;
END //
DELIMITER ;
#truncate

TRUNCATE TABLE your_table_name;



#rename 
RENAME TABLE old_table TO new_table;
RENAME DATABASE current_database_name TO new_database_name;

SET SQL_SAFE_UPDATES = 0;

#DML

#INSERT
INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);


#DELETE FROM table_name WHERE condition;

DELETE FROM employee WHERE name ='Robin';

DELETE FROM new_1;

#update 

update   employee set   occupation= 'tea'
where occupation='Teacher';


#call .
CALL procedure_name ( parameter(s));



#EXPLAIN
EXPLAIN employee;


#dcl 

GRANT SELECT, UPDATE ON MY_TABLE TO SOME_USER, ANOTHER_USER; 

 REVOKE SELECT, UPDATE ON MY_TABLE FROM USER1, USER2;
 
 #tcl
 
  #Commits a Transaction
  
COMMIT;  

#Rollbacks a transaction in case of any error occurs.
ROLLBACK;  
SET  AUTOCOMMIT = OFF;

select * from employee; 
delete FROM  employee WHERE  occupation= 'tea';
ROLLBACK;

#SAVEPOINT: Sets a save point within a transaction.


SAVEPOINT SAVEPOINT_NAME;  

#https://www.javatpoint.com/savepoint-in-sql


 
 




