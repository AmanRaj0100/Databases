--SELECT: Data Retrieval Language

--Types of SQL: DML, DDL, DCL & TCL


-----------------------------------------DDL: Data Definition Language------------------------------------

----- Database is collection of objects.

----- In DDL we mainly deal with the structure of the objects in the Database.

----- Creating a database: --Types: --1. Using Command -> Syntax: CREATE DATABASE databasename;
								    --2. Graphically

----- Droping a database: Using Command -> Syntax: DROP DATABASE databasename;

/*
Difference between String datatype "char vs. varchar":

-> first_name char(10); 'pooja' : 10 bytes
-> first_name char(10); 'sharma' : 6 bytes

varchar saves memory consumption as it varies according to the input.
*/

-- String datatype: nchar -> stores fixed length unicode character.
-- String datatype: nvarchar -> stores variable length unicode character.



CREATE DATABASE example;

USE example; -- Set your database

-----------Creating a table-------------

CREATE TABLE emp --- Here all columns are initiated with null values.
(emp_id smallint,
emp_name varchar(30),
hire_date date);


-----------Copying a table structure-------------

SELECT * 
INTO emp_copy -- Will copy the table structure of emp table with new name emp_copy
FROM emp;

SELECT first_name,last_name,hire_date,salary
INTO example.dbo.emp_copy_sample -- Will copy the table structure of employees table from ATLAS_AMAZON database to new name emp_copy_sample table of example database
FROM ATLAS_AMAZON.dbo.employees;


-----------Altering a table structure-------------

--We can also alter table structur graphically by right-click on the table and then on Design to modify the datatypes.

ALTER TABLE emp
ADD salary decimal(9,2); -- Adds a salary column with decimal data type

ALTER TABLE emp
ALTER COLUMN emp_name varchar(40); -- Modify the string length of the varchar datatype of emp_name column

ALTER TABLE emp
DROP COLUMN salary; -- Removes salary column from the emp table


--dba- database administrator who creates the database.
--dbo- database owner who has the rights to a particular table to work on with various commands.


------ERD Conversion pdf: Final Bank Schema------

CREATE TABLE bank 
(bank_code varchar(10),
bank_name varchar(30),
bank_address varchar(40));

CREATE TABLE account
(account_no smallint,
account_type varchar(20),
branch# varchar(20));

--------------------Renaming a Table-----------------------------------------
/*•With the help of inbuilt procedure sp_rename we can rename a table.
	•Syntax: Execute sp_rename ‘oldtablename’, ‘new_tablename’
*/

Execute sp_rename 'Employee' , 'Emp';



------------------------------------Defining and Adding Constraints------------------------------------

-- Constraints enforce rules at the table level.
-- Constraints prevent the deletion of a table if there are dependencies.
/*
The following constraint types are valid:
•DEFAULT
•UNIQUE
•PRIMARY KEY
•FOREIGN KEY
•CHECK
*/

--Constraints are also Objects just like Table is also a object.
/*
Constraint Guidelines:
•SQLServer automatically generates a constraint name
•Create a constraint either:
		•At the same time as the table is created, or
		•After the table has been created
•Define a constraint at the column or table level.
*/

-- If we do not provide a constraint name it will be automatically allocated.

-- NOT NULL is also considered as a Constraint, so that there is no null values for that particular column.

--Example:

---------------Constraints at Column level--------------------------

CREATE TABLE dept
(dept_no int,
dept_name varchar(30),
budget money NOT NULL CONSTRAINT dept_budget_df DEFAULT 100000);

drop table dept;

create table dept
(deptno int,
dname varchar(30) constraint dept_dname_uk unique, -- It can have multiple null values because no one null is equal to other null.
budget money not null constraint dept_budget_df default 100000);

drop table dept;

drop table emp;

create table emp
(empno int primary key,
ename varchar(30) not null,
salary decimal (9, 2),
hire_date date);


---------------Constraints at Table level--------------------------

create table dept
(deptno int constraint dept_deptno_pk primary key,
dname varchar(30),
budget money not null constraint dept_budget_df default 100000,
constraint dept_dname_uk unique(dname)
);

create table grades
(student_id tinyint,
course_id tinyint,
grade char(2),
primary key (student_id,course_id)-- Composite Primary Key can be implemented this way or one can be set at column level and another at table level.
);


---------------------------------Check Constraint--------------------------

--The CHECK constraint allows you to specify the values in a column that must satisfy a Boolean expression.

--Syntax: CHECK (expr)

--Example:

drop table dept;

create table dept
(deptno int constraint dept_deptno_pk primary key,
dname varchar(30),
budget money not null constraint dept_budget_df default 100000,
constraint dept_dname_uk unique(dname),
constraint dept_deptno_ck check (deptno between 10 and 999)
);


---------------------------------Foreign Key Constraint--------------------------
/*
FOREIGN KEY Constraint Keywords:

--FOREIGN KEY: Defines the column in the child table at the table constraint level

--REFERENCES: Identifies the table and column in the parent table

--When an UPDATE or DELETE operation affects a key value in the parent table
that has matching rows in the child table, the result depends on the referential
action specified by ON UPDATE and ON DELETE subclauses

--CASCADE: Delete or update the row from the parent table and automatically delete or update the matching rows in the child table

--SET NULL: Delete or update the row from the parent table and set the foreign
key column or columns in the child table to NULL

--SET DEFAULT: Delete or update the row from the parent table and set the
foreign key column or columns in the child table to DEFAULT value if specified.

--NO ACTION: Default action, Will not allow to delete a row in parent table if there are one or many rows present in child table.
*/

drop table emp;

create table emp
(empno int primary key,
ename varchar(30) not null,
salary decimal(9,2),
hire_date date,
deptno int constraint emp_deptno_fk references dept(deptno) );---Foreign Key Constraint at Column level.


create table empl
(empno int primary key,
deptno int,
ename varchar(30) not null,
salary decimal (9,2),
hire_date date,
constraint emp1_deptno_fk foreign key (deptno) references dept(deptno) );---Foreign Key Constraint at Table level.


-----Cascade on Foreign Key-----

--Example:

create table emp2
(empno int primary key ,
deptno int DEFAULT 10,
ename varchar (30) not null,
salary decimal (9, 2),
hire_date date,
foreign key (deptno) References dept(deptno) ON DELETE SET DEFAULT ON UPDATE CASCADE);

----------------Adding a Constraint----------------

CREATE TABLE LOCATION
(location_id int,
location_name varchar (20));

ALTER TABLE location
ADD UNIQUE (location_id);

------Adding Foreign Key Constraint when tables are already created----------

CREATE TABLE abc
(a int primary key,
b int not null,
c int);

CREATE TABLE abc_ref
(b int ,
c int,
x int primary key);

ALTER TABLE abc_ref
ADD FOREIGN KEY (b) references abc(a);


------Adding DEFAULT Constraint when tables are already created----------
--Syntax:
		--ALTER TABLE tablename
		--ADD CONSTRAINT constraintname
		--DEFAULT (default_value)FOR column_name

--Example:

ALTER TABLE abc
ADD CONSTRAINT abc_def default(10) for c;

alter table abc
add d int default(10);


-------------------------Dropping a Constraint----------------------------

--Syntax:
		--ALTER TABLE table_name
		--DROP CONSTRAINT constraint_name;

--Example:

alter table dept
drop constraint dept_budget_df;




-- DDL Practice Questions: With reference to the ERD case study of Bank. Create all the tables with primary key and foreign keys. 
							--Use your domain knowledge and add other constraints like NOT NULL, DEFAULT, CHECK and UNIQUE constraints. 

--Example: 

drop table bank;
drop table account;
drop table account_holder;
drop table branch;
drop table customer;

CREATE TABLE bank 
(bank_code varchar(10) primary key,
bank_name varchar(30),
bank_address varchar(40));


CREATE TABLE account
(account_no smallint primary key,
account_type varchar(20),
branch# varchar(20),
constraint account_branch#_fk foreign key (branch#) references branch(branch#));


CREATE TABLE account_holder
(account_no smallint,
customer# smallint
primary key (account_no,customer#) );


CREATE TABLE branch 
(branch# varchar(20),
bank_code varchar(10),
branch_name varchar(30),
branch_address varchar(40)
primary key (branch#,bank_code),
constraint branch_bank_code_fk foreign key (bank_code) references bank(bank_code) );


CREATE TABLE customer 
(customer# smallint primary key,
customer_name varchar(10),
customer_address varchar(40),
customer_contact smallint);


CREATE TABLE loan
(loan# smallint primary key,
loan_type varchar(20),
branch# varchar(20));


CREATE TABLE loan_details 
(loan# smallint,
customer# smallint,
loan_amt int,
duration int,
sanction_date date, 
roi tinyint
primary key (loan#,customer#) );


---------------------------------------------------------------------------------------------------------

create table loan
(
loan# varchar(20) primary key,
loanType varchar(20),
branch# varchar(20) foreign key references branch(branch#)
);

create table loan_details
(
loan# varchar(20) foreign key references loan(loan#),
customer# varchar(20) foreign key references customer(customer#),
loanAmount int,
duration int,
dateOfSacntion date,
rateOfInterest decimal(2,2),
primary key(loan#, customer#)
);