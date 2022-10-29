-----------------------------------------DDL: Data Manipulation Language------------------------------------

/*------- Created table to work on with DML commands-------
create table dept
(deptno int constraint dept_deptno_pk primary key,
dname varchar(30),
budget money not null constraint dept_budget_df default 100000,
constraint dept_dname_uk unique(dname)
);
*/

SELECT * FROM dept;

INSERT INTO dept
values (10, 'SALES' , 10000);

INSERT INTO dept(deptno, budget)
values (20,20000);

INSERT INTO dept(deptno,dname, budget)
values (40,'PURCHASE',25000),
		(50,'CUSTOMER_CARE',30000);

UPDATE dept
SET budget=2000, dname='LEARNING' WHERE deptno=20;

-- All rows in the table are deleted if you omit the WHERE clause.

DELETE FROM dept -- Here we can also use "DELETE dept", FROM is optional
WHERE budget > 25000;