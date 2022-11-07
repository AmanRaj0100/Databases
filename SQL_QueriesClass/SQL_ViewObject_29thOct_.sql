-------------------------------------------------------------------VIEW: SQL Server Object----------------------------------------------------------

--View: Logically represents subsets of data from one or more tables

-- There are three layers in the architecture of DBMS:
	-- 1. View (N users) -> End User
	-- 2. Conceptual Level (1 user) -> dba/programmer
	-- 3. Physical Level (1 user) -> Hard disk

--Example:

create view emp_30
as
select employee_id,manager_id,last_name,first_name,job_id	--Sub Query (Selected data that will be showed for emp_30)
from employees
where department_id=30;

-- Views are stored in the form of sub queries format. We can see it by going on Views>Right_Click on emp_30>Design
--Here, we can see it is running a sub query on employees table.
--Views does not make permanent tables, it just runs that sub query on the employess table to get the results.

--Views are mainly used to restrict the data which only a particular user can see.
--It is also used to implement ROW and COLUMN level security.
--It presents different views of the same data.

--And at the user level it just looks like emp_30 is a separate table.

Select * From emp_30;

----------------------------------------------------------------------------------------------------------------------------

create view sal50
as
select employee_id as ID_NUMBER, last_name as NAME, salary*12 as ANN_SALARY
from employees
where department_id=50;


Select * From sal50;

----------------------------------------------------------------------------------------------------------------------------

create view emp_60
as
select employee_id empid, concat(last_name,first_name) as full_name, department_id
from employees
where department_id=60;


Select * From emp_60;

--------------------------------------------Complex type of View----------------------------------------------------------

create view sum_view (deptno,minimum_salary,maximum_salary,total_salary)-- Here column name can be given like this also
as
select department_id, min(salary), max(salary), sum(salary)
from employees
group by department_id;


Select * From sum_view;

--------------------------------------------Updating a View---------------------------------------------------------------