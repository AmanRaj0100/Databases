------------------Stored Procedures_04thNov-------------------

--We define a function for a task which is to be repeated again and again.

--Stored Procedures may or may not retrun values
--Function returns the value

--Modularization of Stored procedures, Functions and Triggers means code can be divided in blocks according to our use.

--Every SQL commands are send separately to the server, but if they are clubbed inside a stored procedure they will be considered as a single
----unit and will be sent to the server at once. Which will in turn increase the performance.

--Example:

create procedure spGetEmpDetails
as
BEGIN
select employee_id,first_name,last_name,salary
from employees
END

--Execute a Procedure

EXEC spGetEmpDetails;
EXECUTE spGetEmpDetails;
spGetEmpDetails; --Can be called like this inside another procedure



--Procedure with Input Parameters

create proc spGetEmpDeptDetails
@p_Department_id int ---Keep the datatype same as of the columns for parameters to avoid runtime error
as
BEGIN
select employee_id,department_id,salary
from employees
where department_id=@p_Department_id
END


EXEC spGetEmpDeptDetails 50

EXEC spGetEmpDeptDetails '60' --It will be implicitly converted to int

EXEC spGetEmpDeptDetails 'abc'---Error (Datatype should be int)



--Practice Question: 1: create a procedure that takes the department_name from ther user
--and shows the first_name, last_name, department_id , salary 
--of all the employees working in that department.  

--Solution:

create proc spGetDeptDetails
@p_Department_Name varchar(30)
as
BEGIN
select first_name,last_name,salary
from employees
join departments
on employees.department_id=departments.department_id
where departments.department_name=@p_Department_Name
END


EXEC spGetDeptDetails 'Marketing'

---Through SubQuery
create procedure spDeptName
@v_dept_name varchar(30)
as
BEGIN
select e.first_name, e.last_name, e.department_id, e.salary
from employees e where e.department_id = (select d.department_id from departments d where d.department_name = @v_dept_name);
END 

EXEC spDeptName'Marketing'


--Practice Question: 2: Create a procedure which takes a number from the user and returns the ten times of the same number. 

create procedure spTimes10
@p_num int
as
BEGIN
set @p_num=@p_num*10
print @p_num
END 

EXEC spTimes10 10


--Procedure with Output Parameters

Create Procedure sp_TotalEmp
@Department_id int, --variable, constant
@EmployeeCount int output --variable
as
BEGIN
select
EmployeeCount = Count(employee_id)
from employees
where department_id =@Department_id
END

Declare @Empcount int
Execute sp_TotalEmp 20,@Empcount output
print @Empcount


Declare @Empcount int
Declare @Deptid int=20 --@Deptid here is input where we are assiging a value to it
Execute sp_TotalEmp @Deptid,@Empcount output --Note : If you don’t specify the OUTPUT keyword the @Empcount variable would be null
print @Empcount

--Example:

create procedure spTimes10withOutput
@p_num int,
@p_num_out int output
as
BEGIN
set @p_num_out=@p_num*10
END


Declare @op_num_out int
EXEC spTimes10withOutput 10, @op_num_out output
print @op_num_out

--Calling Stored Procedure

--Example:

create procedure EmpDeptCityWise
	@deptname varchar(30),
	@city varchar(20)
as
begin
select * from employees
where department_id = (select department_id 
						from departments 
						where department_name=@deptname and location_id=(select location_id 
																from locations
																where city=@city));
end


EmpDeptCityWise 'Administration', 'Seattle' ---Positional

EmpDeptCityWise @deptname='Administration', @city='Seattle' ----Named

EmpDeptCityWise 'Administration', @city='Seattle'--Mixed Mode (Positional and Named)--When you start naming then after that whichever variable comes that must be also named.


--View the Text of Stored Procedure

--1.Use system stored procedure sp_helptext ‘SPName’

sp_helptext EmpDeptCityWise

--2. Through object explorer

----RightClick on Procedure and then Click on Modify


--ALTER and DROP

---To change the stored procedure:
-----ALTER PROCEDURE ‘procecedure_name’;

---To delete a stored procedure:
-----DROP PROCEDURE ‘procecedure_name’;

--To Encrypt the text of stored procedure , use WITH ENCRYPTION option. It is not possible to view the text of an encrypted SP.

drop procedure spTimes10withOutput

create procedure spTimes10withOutput
@p_num int,
@p_num_out int output
with encryption-- for encryption option
as
BEGIN
set @p_num_out=@p_num*10
END


sp_helptext spTimes10withOutput --Output: The text for object 'spTimes10withOutput' is encrypted.

sp_help spTimes10withOutput --It will only show parameter and its datatype.

sp_depends employees --View the dependencies of the stored procedure. It is very useful,
								--if you want to check, whether there is any stored procedure referencing one table you are about to drop.
								--This procedure could also be used with other database objects like table.

--If we want to drop a table we can but its safe to see the dependencies first.
--As if we drop the table it will be compiled again

---Insert values into a table through Stored procedures

create procedure add_dept
@deptid int,
@deptname varchar(30),
@manager_id int,
@location_id int
as 
begin
	insert into departments(department_id,department_name,manager_id, location_id)
	values (@deptid, @deptname,@manager_id,@location_id);
end

select * from departments 
exec add_dept 300,'abc',100,1700

select * from departments;



--Practice Question: 3:create a procedure that will update the salary of a given employee_id
create proc spUdateSal
@p_emp_id int
as
BEGIN
	update employees
	set salary=150
	where employee_id=@p_emp_id
END


EXEC spUdateSal 101


select employee_id,salary from employees where employee_id=101


--Advantages of Stored Procedures
-----Execution plan retention and reusability
----- Reduces network traffic
----- Code reusability and better maintenance
----- Better security
----- Avoids SQL Injection attack.