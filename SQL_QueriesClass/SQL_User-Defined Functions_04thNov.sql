---------------------------User-Defined Functions_04thNov--------------------------

--User-Defined Functions
---- In SQLSever there are 3 types of User Defined Functions
---------Scalar Functions
--------- Inline Table-Valued Functions
--------- Multi-Statement Table Valued Functions

--Funtions cannot use DML statements like INSERT, UPDATE, etc.

--Scaler Functions
---- Scaler Functions may or may not have parameters, but always returns a single/scalar value.
---- The returned value can be of any datatype except:
													---- Text
													---- Ntext
													---- Image
													---- Cursor
													---- Timestamp

--Example:

CREATE FUNCTION tax
(@psalary decimal(18,0))
RETURNS dec(18,0)
AS
BEGIN
DECLARE @rtax dec(18,0)
SET @rtax=@psalary*.08
RETURN @rtax
END


--Invoking Function--
----- When calling a scalar function, you must specify a two-part name :
				-- OwnerName.FunctionName
						Select dob.tax(100000)
				-- Dbo stands for database owner
----- You can also invoke it using the complete 3 part name
----- DatabaseName.OwnerName.FunctionName
		Select sample.dob.tax(100000)



--Invoking UDF--
----- Scalar UDF can be used in the SELECT Clause
				SELECT dbo.tax(salary) as tax FROM employee;
----- Scalar UDF can be used in the SELECT WHERE Clause:
				SELECT first_name, last_name, salary, dbo.tax(salary) AS M_tax
				FROM employee
				WHERE dbo.tax(salary*12) > 10000;


--ALTER and DROP--
----- To change the User Defined Function:
			--ALTER FUNCTION ‘function_name’;

----- To delete a User Defined Function :
			--DROP FUNCTION ‘function_name’;


--Practice Question: 1:create function in which you take the employeeid of a employee and return the salary of that employee

--Solution:
CREATE FUNCTION return_salary
(@p_empid int)
RETURNS dec(8,2)
AS
BEGIN
DECLARE @r_sal dec(8,2)
Select @r_sal=salary from employees where employee_id=@p_empid
RETURN @r_sal
END


Declare @emp_sal dec(8,2)
set @emp_sal=dbo.return_salary(101)
print @emp_sal


select employee_id, salary from employees where employee_id=101

--Salary of every employee using return_salary function
select employee_id,dbo.return_salary(employee_id) from employees