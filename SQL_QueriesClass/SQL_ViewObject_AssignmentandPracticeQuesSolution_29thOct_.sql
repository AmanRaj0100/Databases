--------------------------SQL_ViewObject_AssignmentandPracticeQuesSolution_29thOct------------------------------

-------Day 5: Assignment 


select * from employees
select * from departments
select * from locations
select * from countries
select * from regions
select * from job_grades


--Solution 7:

create view countrywise_report (country,region,total_salary,avg_salary)
as
select c.country_name,r.region_name, sum(salary), avg(salary)
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
join countries c
on c.country_id=l.country_id
join regions r
on r.region_id=c.region_id
group by c.country_name, r.region_name;


select * from countrywise_report;



--Solution 8:


alter view countrywise_report (country,region,total_salary,avg_salary,max_salary)
as
select c.country_name,r.region_name, sum(salary), avg(salary), max(salary)
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
join countries c
on c.country_id=l.country_id
join regions r
on r.region_id=c.region_id
group by c.country_name, r.region_name;


select * from countrywise_report;


--Solution 9:


drop view countrywise_report;



------------Practice Questions: 1

--Solution:

create view SALARY_VU (Employee,Department,Salary,Grade)
as
select concat(first_name,' ',last_name),department_name,salary,grade_level
from employees
join departments
on employees.department_id=departments.department_id
join job_grades
on employees.salary between job_grades.lowest_sal and job_grades.highest_sal;


select * from SALARY_VU;

drop view SALARY_VU;


------------Practice Questions: 2

--Solution:

create view DEPT20 (empid,ename,deptid)
as
select employee_id, first_name,department_id from employees
where department_id=20
with check option;


select * from DEPT20;

drop view DEPT20;


------------Practice Questions: 3 (Same as Ques 2 as we have already implemented With Check Option)

--Solution:

create view DEPT20 (empid,ename,deptid)
as
select employee_id, first_name,department_id from employees
where department_id=20
with check option;
